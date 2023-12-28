class Public::GenresController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    Kaminari.config.default_per_page = 20# 特定のアクションでKaminariの設定を変更
    @genres = Genre.all.page(params[:page])
    Kaminari.config.default_per_page = 10# 設定を元に戻す
  end
  def show
    Kaminari.config.default_per_page = 20
    @genre = Genre.find_by(id: params[:id])

    if @genre.nil?
      flash.now[:alert] = "選択された作品がありません。"
      # ジャンルが見つからない場合の処理をここに追加（例えばエラーメッセージを表示するなど）
    else
      @items = @genre.items.page(params[:page])
    end

    Kaminari.config.default_per_page = 10
  end
end
