class ApplicationMailer < ActionMailer::Base
  # default from: 'from@example.com'
  default from: 'amulabamulab@gmail.com'
  layout 'mailer'
  
  def welcome_email
    @admin.email = amulabamulab@gmail.com
    @user = params[:user]
    # mail(to: @user.email, subject: 'メールのタイトルがここに入ります')
    mail(to: @admin.email, subject: '【Amlab管理者宛】Amlabにてお問い合わせがありました。')
  end
end
