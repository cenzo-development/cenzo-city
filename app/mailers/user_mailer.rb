class UserMailer < ApplicationMailer
  default from: 'info@cenzo.nl'

  def forgot_password(user)
    @greeting = 'Hoi'
    @user = user
    #@url = edit_password_reset_url(@user.password_reset_token)

    mail to: user.email, :subject => 'Reset password instructions'
  end

end
