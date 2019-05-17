

class SessionsController < ApplicationController

  rescue_from StandardError do |e|
    show_message(:error, "you have entered an incorrect email and password combination", :now => true, :object => self, :action => :new)
    #send_file(Rails.root.join('public', '404.html'), type: 'text/html; charset=utf-8', status: 404)
  end

  def new

  end

  def create
    login_credentials = LoginCredentials.new(params[:email], params[:password])

    if LoginContext.call(login_credentials)
      redirect_to confirm_mobile_path
      set_user_session(login_credentials.email, self) if PasscodeGenerationContext.call(login_credentials.email)
    else
      show_message(:error, "you have entered an incorrect email and password combination", :now => true, :action => :new, :object => self)
    end
  end

  def destroy
    remove_user_session(self)
  end

  private

  def set_user_session(user_email, controller)
    SessionCreationContext.call(user_email, controller)
  end

  def remove_user_session(controller)
    SessionDestructionContext.call(controller)
    redirect_to new_session_path
  end

  def current_instance
    self
  end


end
