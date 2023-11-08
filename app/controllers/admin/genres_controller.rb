class Admin::GenresController < ApplicationController
  before_action :authenticate_admin # ログインしていてかつ管理者である
  def index
    Kaminari.config.default_per_page = 20# 特定のアクションでKaminariの設定を変更
    @genres = Genre.all.page(params[:page])
    Kaminari.config.default_per_page = 10# 設定を元に戻す
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルが正常に登録されました。"
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      # ジャンルが正常に更新された場合の処理
      redirect_to admin_genres_path, notice: 'ジャンルが更新されました。'
    else
      # ジャンルの更新に失敗した場合の処理
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません"
    end
  end

end
