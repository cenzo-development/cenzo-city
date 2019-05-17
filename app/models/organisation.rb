class Organisation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Autoinc

  field :name, type: String
  field :level, type: String
  field :organisation_type, type: Array, default: []
  field :main_company, type: String
  field :kvk_number, type: String
  field :btw_number, type: String
  field :phone_number, type: String
  field :email, type: String
  field :invoice_email, type: String
  field :destination, type: String
  field :billing_required, type: Boolean
  field :use_mailing_address_for_visiting, type: Boolean
  field :use_mailing_address_for_billing, type: Boolean

  has_many :contacts, :class_name 'Person::Contact'
  has_many :contracts, :class_name 'Contract'

  embeds_one :visiting_address, class_name: 'Organisation::Address'
  embeds_one :postal_address, class_name: 'Organisation::Address'
  embeds_one :billing_address, class_name: 'Organisation::Address'


end
