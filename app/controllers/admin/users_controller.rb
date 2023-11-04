class Admin::UsersController < ApplicationController
  def show
    @user = User.ffind(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
  end
end
