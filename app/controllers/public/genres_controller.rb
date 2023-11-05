class Public::GenresController < ApplicationController
  def index
    Kaminari.config.default_per_page = 5# 特定のアクションでKaminariの設定を変更
    @genres = Genre.all.page(params[:page])
    Kaminari.config.default_per_page = 2# 設定を元に戻す
  end
end
