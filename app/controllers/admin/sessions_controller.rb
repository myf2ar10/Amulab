# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :require_admin, only: [:admin_action]

# Deviseのデフォルトの挙動も必要なため、super を呼び出すことで親クラスの new メソッドを実行。
  def new
    super
  end

  def create
    super
  end

  def destroy
    super
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

  protected

  def after_sign_in_path_for(resource)
    public_root_path
  end

  def require_admin
    unless current_user && current_user.admin?
      flash[:alert] = "アクセス権がありません。"
      redirect_to public_root_path
    end
  end


  def configure_sign_in_params
    if current_user && current_user.guest_user?
      flash[:alert] = "ゲストユーザーは管理者としてログインできません。"
      redirect_to public_root_path
    elsif current_user
      flash[:alert] = "アクセス権がありません。"
      redirect_to public_root_path
    end
  end

end
