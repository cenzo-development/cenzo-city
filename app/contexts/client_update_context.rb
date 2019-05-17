class ClientUpdateContext

  def self.call(client_id, form)
    new(client_id, form).call
  end

  def initialize(client_id, form)
    @client = Person::Client.find_by(id: client_id)
    @form = form
    assign_client_updater(@client) if @client
  end

  def call
    @decorated_object.update_client(@form) if @decorated_object
  end

  private

  def assign_client_updater(client)
    @decorated_object = ClientUpdater.new(client)
  end

end
