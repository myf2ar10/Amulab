class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である
  def index
    @items = Item.order(created_at: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
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
