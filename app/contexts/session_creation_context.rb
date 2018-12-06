class SessionCreationContext

  attr_reader :controller

  def self.call(user_email, controller)
    new(user_email, controller).call
  end

  def initialize(user_email, controller)
    begin
      @user = Person::User.find_by(:email => user_email)
    rescue Mongoid::Errors::DocumentNotFound => e
      raise e
    end
    @controller = controller
    assign_session_creator(@user)
  end

  def call
    @decorated_object.create_user_session(@controller) unless @controller == nil
  end

  private

  def assign_session_creator(user)
    @decorated_object = SessionCreator.new(user)
  end

end 
