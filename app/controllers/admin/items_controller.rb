class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, images: [])
  end

end
