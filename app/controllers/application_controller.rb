class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :show_message

  def current_user
    @current_user || Person::User.find(session[:user_id]) if session[:user_id]
  end

  def show_message(msg_type, msg, options={})
    if options[:now]
      flash.now[msg_type] = msg
    else
      flash[msg_type] = msg
    end
    if options[:object]
      options[:object].render(options[:action]) if options[:action]
      options[:object].redirect_to(options[:path]) if options[:path]
    end 
  end

  def authorize
    redirect_to new_session_path unless current_user
  end

end
