class Public::ContactsController < ApplicationController
  before_action :set_contact, only: [:confirm, :back]

  def new
    @contact = Contact.new
  end

  # 確認画面を作成する場合
  # newアクションから入力内容を受け取り、送信ボタンを押されたらcreateアクションを実行
  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      flash.now[:alert] = "入力内容に誤りがあります。修正してください。<エラーコード[1]>"
      render :new
    end
  end

  # 入力内容に誤りがあった場合
  # 入力内容を保持したまま前のページに戻るbackアクションを定義することで可能
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 実際に送信するアクション
  # ここで入力内容を保存。セキュリティーのためにも一定時間で入力内容を削除するか
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "お問い合わせが正常に送信されました。"
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to complition_path
    else
      flash.now[:alert] = "お問い合わせの送信に失敗しました。<エラーコード[2]>"
      render :new
    end
  end

  # 送信完了画面を使用する場合
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone_number, :message)
          # ,:subject
  end

  def set_contact
    @contact = Contact.new(contact_params)
  end

end