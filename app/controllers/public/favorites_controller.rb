class Public::FavoritesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.new(item_id: @item.id)
    @favorite.save
    # flash.now[:notice] = "このアイテムはいいねされました。"
    # redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.find_by(item_id: @item.id)
    @favorite.destroy
    # flash.now[:notice] = "このアイテムのいいねは取り消されました。"
    # redirect_to request.referer
  end

end
