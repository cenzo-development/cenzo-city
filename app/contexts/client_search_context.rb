class ClientSearchContext

  def self.call(query)
    new(query).call
  end

  def initialize(query)
    @query = query
    assign_client_searcher(Person::Client)
  end

  def call
    @decorated_object.search!(@query)
  end

  private

  def assign_client_searcher(client)
    @decorated_object = ClientSearcher.new(client)
  end

end
