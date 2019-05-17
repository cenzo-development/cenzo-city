require 'rails_helper'

describe PsychClientCreationContext do
  let(:form_data) do
    {
      gender: "2",
      deceased: "1",
      inserts: "van",
      work_phone: "0675391402",
      home_phone: "068543219",
      mobile_phone: "098331798",
      birth_date: "23-10-1983",
      email_address: "mail@host.com",
      initials: "F",
      first_name: "Arrow",
      last_name: "Marbel",
      street_name: "stationweg",
      house_number: "78",
      extension: "A",
      bsn: "1766334",
      post_code: "1113FK",
      country: "NL",
      place: "Purmerend"

    }

  end

  let(:client_form) {Forms::ClientCreate.new(form_data)}

  let(:address) do
    {

      address: client_form.street_name,
      house_number: client_form.house_number,
      house_number_extension: client_form.extension,
      zipcode: client_form.post_code,
      city: client_form.place,
      country: client_form.country
    }


  end

  describe "#call" do
    it 'creates address for new client' do
      context = PsychClientCreationContext.new(client_form)
      Person::Client::Address.expects(:new).with(address).at_most_once
      context.call
    end
    it 'assigns a newly created address as @client_address' do
      context = PsychClientCreationContext.new(client_form)
      context.call
      expect(context.instance_variable_get(:@client_address)).to be_instance_of(Person::Client::Address)
    end

    it 'creates a new psych client' do
      context = PsychClientCreationContext.new(client_form)
      expect(context.call).to be_a_new(Person::Client::PsychClient)
    end
    
  end

end
