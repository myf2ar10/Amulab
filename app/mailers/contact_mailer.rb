class ContactMailer < ApplicationMailer

  def send_mail(contact)
    @contact = contact
    mail(to: ENV['TOMAIL'], subject: "【Amulabお問い合わせ】"+ @contact.name+"さんより")
  end

end
