class PsychClientCreationContext

  def self.call(client_form)
    new(client_form).call
  end

  def initialize(form)
    @client_form = form
    @client_address = Person::Client::Address.new({address: @client_form.street_name.capitalize,
                                                  house_number: @client_form.house_number,
                                                  house_number_extension: @client_form.extension,
                                                  zipcode: @client_form.post_code,
                                                  city: @client_form.place,
                                                  country: @client_form.country
                                                })

    assign_client_creator(Person::Client::PsychClient)
  end

  def call
      @decorated_object.create_client(@client_form, @client_address)
  end

  private

  def assign_client_creator(client)
    @decorated_object = PsychClientCreator.new(client)
  end


end
