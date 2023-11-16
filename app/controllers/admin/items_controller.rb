class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である

  def index
    @items = Item.order(created_at: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @favorited_users = @item.favorites.map(&:user)
  end

   def destroy
    @item = Item.find(params[:id])
    if current_admin
      @item.destroy
      flash[:notice] = "作品が削除されました。"
      redirect_to admin_items_path
    else
      flash[:alert] = "削除できませんでした。<エラーコード[19]>"
      redirect_to admin_item_path(@item)
    end
   end

  private

  def item_params
    params.require(:item).permit(:name, :description, :genre_id, images: [])
  end

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません<エラーコード[5]>"
    end
  end

end