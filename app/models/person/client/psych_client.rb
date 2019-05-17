class Person::Client::PsychClient < Person::Client
  #include Mongoid::Document
  field :bsn, type: String
end
