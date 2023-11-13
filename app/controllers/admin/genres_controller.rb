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
    @genres = Genre.all.page(params[:page])
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルが正常に登録されました。"
    else
      flash.now[:alert] = "ジャンルの登録に失敗しました。<エラーコード[11]>"
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
      flash.now[:alert] = "ジャンルの更新に失敗しました。<エラーコード[12]>"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path, notice: 'ジャンルが削除されました。'
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def authenticate_admin
    unless admin_signed_in? # 管理者としてログインしているか確認
      redirect_to public_root_path, alert: "管理者としてログインしていません<エラーコード[3]>"
    end
  end

end
