class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
    if User.find(params[:id]) != current_user
      redirect_to user_path(current_user)
    end
    @favorited_items = current_user.favorited_items
    @item_commented_items = @user.item_commented_items
    @user_items = @user.items


  end

  private

  def set_current_user
    @user = current_user
  end

end