class Admin::UsersController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である
  before_action :require_admin, only: [:destroy]
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
      redirect_to admin_user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      # ユーザー情報の更新が失敗した場合
      flash.now[:alert] = "ユーザー情報の更新に失敗しました。<エラーコード[13]>"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_admin_top_path, notice: "ユーザーを削除しました。"
    else
      flash[:alert] = "ユーザーの削除に失敗しました。<エラーコード[18]>"
      redirect_to admin_user_path(@user)
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, :password, :password_confirmation)

  end

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません。<エラーコード[6]>"
    end
  end

  def require_admin
    unless admin_signed_in?
      flash[:alert] = "管理者としてログインしていません。<エラーコード[6]>"
      redirect_to admin_admin_top_path
    end
  end

end
