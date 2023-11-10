class Admin::HomesController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である
  def top
    @users = User.all
  end

  private

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません<エラーコード[4]>"
    end
  end

end
