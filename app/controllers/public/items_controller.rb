class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])    # ページネーション
  end

  def show
    @item = Item.find(params[:id])

    # @item_favorite を初期化
    # @item_favorite = Favorite.find_or_initialize_by(item: @item, user: current_user)

    # if @item_favorite.favorite?(current_user)
    #   # すでにいいね済みの場合のコード
    #   flash.now[:notice] = "このアイテムはいいねされています。"
    # else
    #   # いいねしていない場合のコード
    #   flash.now[:notice] = "このアイテムはいいねされていません。"
    # end

  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) # アイテムをIDで取得
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)  # 新しいアイテムを作成
    if @item.save  # データベースに保存
      flash[:notice] = "作品が新規登録されました。"
      redirect_to items_path  # 一覧ページにリダイレクト
    else
      flash[:alert] = "作品が新規登録されませんでした。"
      render :new
    end
  end

  def new
    @item = Item.new  # 新しいアイテムのインスタンスを作成
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, images: [])
  end

end
