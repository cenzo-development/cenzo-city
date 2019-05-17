FactoryBot.define do
  factory :person_client_address, class: 'Person::Client::Address' do
    address {nil}
    zipcode {nil}
    city {nil}
    house_number {nil}
    house_number_extension {nil}
    country {nil}
  end
end
