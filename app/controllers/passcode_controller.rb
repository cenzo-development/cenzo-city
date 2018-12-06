class PasscodeController < ApplicationController

  def confirm
    @usr_presenter = UserPresenter.new(current_user)
  end

  def enter
    user = current_user
    SendPasscodeContext.call(user)
    @usr_presenter = UserPresenter.new(user)
  end

  def submit
    code = params[:verificationcode]
    if PasscodeVerificationContext.call(current_user, code)
      show_message(:success, %{you are now logged in})
      redirect_to root_path
    else
      show_message(:error, %{you have entered an incorrect code}, :now => true, :action => :enter, :object => self)
    end
  end

end
