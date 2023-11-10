class Public::ItemsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update], unless: :current_admin
  def index
    @items = Item.order(created_at: :desc).page(params[:page])    # ページネーションdesc => 大きい順asc  => 小さい順
  end

  def show
  @item = Item.find(params[:id])
  @item_comment = ItemComment.new

  # @item_favorite を初期化
  @item_favorite = Favorite.find_or_initialize_by(item: @item, user: current_user)

  # if @item_favorite.favorited?(current_user, @item)
  #   # すでにいいね済みの場合のコード
    # flash.now[:notice] = "このアイテムはいいねされています。"
  # # else
  # #   # いいねしていない場合のコード
  # #   flash.now[:notice] = "このアイテムはいいねされていません。"
  # end
  # if @favorite
  #   @favorite.destroy
  #   flash[:notice] = "いいねを取り消しました。"
  # else
  #   flash[:alert] = "いいねが見つかりませんでした。"
  # end

  # redirect_to request.referer
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
    @item.user_id = current_user.id
    if @item.save  # データベースに保存
      flash[:notice] = "作品が新規登録されました。"
      redirect_to items_path  # 一覧ページにリダイレクト
    else
      flash.now[:alert] = "作品が新規登録されませんでした。<エラーコード[8]>"
      render :new
    end
  end

  def new
    @item = Item.new  # 新しいアイテムのインスタンスを作成
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, images: [])
  end

#   def is_matching_login_user
#     if current_user.nil?
#       redirect_to new_user_session_path, alert: "ログインしてください<エラーコード[9]>"
#     else
#       @item = Item.find(params[:id])  # 編集対象のアイテムを特定
#       if @item.user_id != current_user.id
#         redirect_to items_path, alert: "他のユーザーの編集は許可されていません<エラーコード[10]>"
#       end
#     end
#   end

# end

  def is_matching_login_user
    @item = Item.find(params[:id])

    if current_user.nil?
      redirect_to new_user_session_path, alert: "ログインしてください<エラーコード[9]>"
    elsif !current_admin && @item.user_id != current_user.id
      redirect_to items_path, alert: "他のユーザーの編集は許可されていません<エラーコード[10]>"
    end
  end
end