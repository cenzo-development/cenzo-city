

class PasswordResetsController < ApplicationController


  def new
  end

  def create
    usr_email = params[:email]
    if usr_email && PasswordResetContext.call(usr_email)
      show_message(:notice, "E-mail sent with password reset instructions", path: new_session_path, object: self)
      #redirect_to new_session_path
    else
      show_message(:error, "you have entered an invalid email", now: true, action: :new, object: self)
    end
  end

  def edit
    @password_edit = Forms::PasswordEdit.new
  end

  def update
    token = params[:id]
    @password_edit = Forms::PasswordEdit.new(password_edit_params)
    if PasswordUpdateContext.call(@password_edit, token)
      show_message(:notice, "Password has been reset", path: new_password_reset_path, object: self)
    else
      show_message(:error, "Server error: unable to reset password", now: true, action: :edit,  object: self)
    end
  rescue StandardError => e
    show_message(:error, e.message, now: true, action: :edit, object: self)
  end

  private

  def password_edit_params
    params.require(:password_edit).permit(:password, :password_confirmation)
  end

end
