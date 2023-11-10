class Admin::UsersController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      # ユーザー情報の更新が成功した場合
      redirect_to admin_user_path, notice: "ユーザー情報を更新しました"
    else
      # ユーザー情報の更新が失敗した場合
      render :show
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)
  end

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません<エラーコード[6]>"
    end
  end

end
