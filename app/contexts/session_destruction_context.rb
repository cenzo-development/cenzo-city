class SessionDestructionContext

  def self.call(controller)
    new(controller).call
  end

  def initialize(controller)
    @controller = controller
  end

  def call
    @controller.session.delete(:user_id)
  end

end
