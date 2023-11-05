class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
  end

  def about
  end

  def index
  end

  def create
    @user = User.new
  end

  def information
  end

  def complition
  end
end
