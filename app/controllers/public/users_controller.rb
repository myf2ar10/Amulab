class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
    @favorited_items = current_user.favorited_items
    @item_commented_items = @user.item_commented_items
  end

  private

  def set_current_user
    @user = current_user
  end

end
