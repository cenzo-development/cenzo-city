class Person::Client < Person
  #include Mongoid::Document

  field :gender, type: Integer, default: 0
  field :deceased, type: Boolean
  field :inserts, type: String
  field :work_phone, type: String
  field :home_phone, type: String
  field :birth_date, type: Date
  field :number, type: Integer


  increments :number

end
