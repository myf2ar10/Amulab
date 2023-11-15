# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_sign_in_params, only: [:create]
  before_action :check_user_status, only: [:create]

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), notice: "ゲストユーザーでログインしました。"
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  private

  def check_user_status
    user = User.find_by(email: params[:user][:email])
    if user && user.status == 'suspended'
      flash[:alert] = 'アカウントが利用停止されています。<エラーコード17>'
      redirect_to public_root_path
    end
  end

end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end