class Organisation
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Autoinc

  field :name, type: String
  field :level, type: String
  field :type, type: String
  field :main_company, type: String
  field :vat_number, type: String
  field :chamber_commerce, type: String
  field :phone_number, type: String
  field :email, type: String
  field :invoice_email, type: String
  field :destination, type: String
  field :contact_name, type: String
  field :reference, type: String
  field :debiteurnr, type: String
  
  #has_many :contacts, :class_name 'Person::Contact'
  #has_many :contracts, :class_name 'Contract'

  embeds_one :visiting_address, class_name: 'Organisation::Address'
  embeds_one :mailing_address, class_name: 'Organisation::Address'
  embeds_one :billing_address, class_name: 'Organisation::Address'

end
