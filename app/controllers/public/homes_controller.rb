class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @genres = Genre.all
  end

  def about
  end

  def index
  end

  def create
    @user = User.new
  end

  def information
    @information = Information.new(information_params)  # フォームから送信された情報を使って新しい情報を作成
    if @information.save  # 情報の保存に成功した場合
      flash[:notice] = "お問い合わせが正常に送信されました。"
      redirect_to complition_path  # リダイレクト先を指定
    else
      flash.now[:alert] = "お問い合わせの送信に失敗しました。"
      # 情報の保存に失敗した場合の処理
      render :create  # 新規作成ページを再表示
    end
  end

  def complition
  end
end
