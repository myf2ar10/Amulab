class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]) # アイテムをIDで取得
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def create
  end

private

  def item_params
    params.require(:item).permit(:name, :description)
  end

end
