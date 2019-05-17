class Person::Client::Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  geocoded_by :full_address
  before_validation :geocode, :if => :changed?

  field :address
  field :house_number
  field :house_number_extension
  field :city
  field :country
  field :zipcode
  field :coordinates

  embedded_in :client, class_name: 'Person::Client' 

  #validates :coordinates, presence: true

  def full_address
    "#{address} #{house_number} #{house_number_extension}, #{zipcode} #{city} #{country}"
  end

  def address_house_number
    "#{address} #{house_number} #{house_number_extension}"
  end

  def zipcode_city
    "#{zipcode} #{city}"
  end

  def didtance_from_address(adress)
    if distance_from_address(address.to_coordinates, :km).round(2) == nil
      return 500
    else
      distance_from_address(address.to_coordinates, :km).round(2)
    end
  end

end
