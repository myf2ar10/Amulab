class Public::ItemsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :destroy], unless: :current_admin
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @items = Item.order(created_at: :desc).page(params[:page])    # ページネーション desc => 大きい順 asc  => 小さい順
  end

  def show
    @item = Item.find(params[:id])
    @item_comment = ItemComment.new
    # @item_favorite を初期化
    @item_favorite = Favorite.find_or_initialize_by(item: @item, user: current_user)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) # アイテムをIDで取得
    if @item.update(item_params)
      flash[:notice] = "作品が更新されました。"
      redirect_to item_path(@item)
    else
      flash.now[:alert] = "作品の更新に失敗しました。<エラーコード[7]>"
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)  # 新しいアイテムを作成
    tags = Vision.get_image_data(item_params[:image])    # Vision API用
    @item.user_id = current_user.id
    if @item.save  # データベースに保存
      flash[:notice] = "作品が新規登録されました。"
      tags.each do |tag|    # Vision API用
        @item.tags.create(name: tag)    # Vision API用
      end    # Vision API用
      redirect_to items_path  # 一覧ページにリダイレクト
    else
      flash.now[:alert] = "作品が新規登録されませんでした。<エラーコード[8]>"
      render :new
    end
  end

  def new
    @item = Item.new  # 新しいアイテムのインスタンスを作成
  end

 def destroy
  @item = Item.find(params[:id])
  if current_user && (@item.user == current_user || current_admin)
    @item.destroy
    flash[:notice] = "作品が削除されました。"
    redirect_to items_path
  else
    flash[:alert] = "削除権限がありません。<エラーコード[19]>"
    redirect_to item_path(@item)
  end
 end


  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, images: [])
  end

  def is_matching_login_user
    @item = Item.find(params[:id])
    if current_user.nil?
      redirect_to new_user_session_path, alert: "ログインしてください<エラーコード[9]>"
    elsif !current_admin && @item.user_id != current_user.id
      redirect_to items_path, alert: "他のユーザーの編集は許可されていません<エラーコード[10]>"
    end
  end

end