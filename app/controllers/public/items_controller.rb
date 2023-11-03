class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    # @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  end
end
