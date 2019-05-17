require 'rails_helper'

describe ClientUpdateContext do
  let(:address) {FactoryBot.create(:person_client_address)}
  let(:client) {FactoryBot.create(:person_client, address: address)}

  let(:form) do
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
      bsn: "",
      post_code: "1113FK",
      country: "NL",
      place: "Purmerend"

    }

  end

  let(:form_edit) {Forms::ClientEdit.new(form)}

  describe "#call" do
    it 'makes and save changes to an existing client data' do
      context = ClientUpdateContext.new(client.id, form_edit)
      Person::Client.expects(:find_by).with(:id => client.id).at_most_once.returns(client)
      expect(context.call).to eq true
    end
  end

end
