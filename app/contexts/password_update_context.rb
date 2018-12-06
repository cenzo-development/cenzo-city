class PasswordUpdateContext

  def self.call(form, token)
    new(form, token).call
  end

  def initialize(form, token)
    @form = form
    @user = Person::User.find_by(password_reset_token: token)
    assign_update_password(@user)
  end

  def call
    begin
      return nil unless @form.valid? and @user
      @decorated_object.update_password
    rescue StandardError => e
      raise e
    end
  end
  

  private

  def assign_update_password(user)
    PasswordUpdater.new(user)
  end

end
