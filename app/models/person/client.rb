class Person::Client < Person
  require 'autoinc'
  include Mongoid::Autoinc

  #self.per_page = 20

  field :gender, type: Integer, default: 0
  field :deceased, type: Boolean
  field :inserts, type: String
  field :work_phone, type: String
  field :home_phone, type: String
  #field :mobile_phone, type: String
  field :birth_date, type: Date
  field :number, type: Integer
  field :search_terms, type: Array

  increments :number
  index :number => 1

  before_save :fill_search_terms
  before_create :fill_search_terms

  embeds_one :address, :class_name => 'Person::Client::Address'

  def fill_search_terms
    terms = []
    terms << I18n.l(birth_date) 
    write_attribute :search_terms, terms
  end


end
