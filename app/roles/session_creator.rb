
class SessionCreator < SimpleDelegator

  def create_user_session(controller)
    controller.session[:user_id] = self.id 
  end
end
