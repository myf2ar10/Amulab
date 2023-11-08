class ContactMailer < ApplicationMailer
  # def send_mail(contact)
  #   @contact = contact
    # mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  # end
  def send_mail(contact)
    @contact = contact
    # subject_prefix = '&#8203;``【oaicite:0】``&#8203;' # 件名のプレフィックス
    # subject = subject_prefix + @contact.subject.to_s # 整数を文字列に変換
    # mail to: ENV['TOMAIL'], subject: subject
    # mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
    mail to: ENV['TOMAIL'], subject: "【Amulabお問い合わせ】"+ @contact.name+"さんより"
  end
end
