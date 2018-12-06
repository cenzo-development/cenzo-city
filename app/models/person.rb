class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  SALUTATION_OPTIONS = %w{sir madam}.freeze

  field :salutation, type: String
  field :initials, type: String
  field :first_name, type: String
  field :mid_name, type: String
  field :last_name, type: String
  field :name, type: String
  field :phone, type: String
  field :mobile_phone, type: String
  field :email, type: String
  field :active, type: Boolean, default: false
  field :ip, type: String
  field :location, type: String


  embeds_one :address, class_name: 'Address'

  index _type: 1
  index name: 1   


end
