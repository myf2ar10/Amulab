class Public::GenresController < ApplicationController
  def index
    Kaminari.config.default_per_page = 20# 特定のアクションでKaminariの設定を変更
    @genres = Genre.all.page(params[:page])
    Kaminari.config.default_per_page = 10# 設定を元に戻す
  end
end
