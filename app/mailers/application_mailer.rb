class ApplicationMailer < ActionMailer::Base

  default from: 'amulabamulab@gmail.com'
  layout 'mailer'

  def welcome_email
    @admin.email = 'amulabamulab@gmail.com'
    @user = params[:user]
    mail(to: @user.email, subject: '【Amulab閲覧者宛】Amulab welcome_email')
    mail(to: @admin.email, subject: '【Amulab管理者宛】Amulab_welcome_email')
  end
end
