class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
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

end
