FactoryBot.define do
  factory :organisation_address, class: 'Organisation::Address' do
    address {nil}
    zipcode {nil}
    city {nil}
    building_number {nil}
    building_name {nil}
    country {nil}
  end
end
