class Organisation::Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :address
  field :building_number
  field :city
  field :country
  field :zipcode
  field :building_name
  field :coordinates, type: Array


  embedded_in :organisation, class_name: 'Organisation'

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
