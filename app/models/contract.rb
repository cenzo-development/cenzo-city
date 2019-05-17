class Contract
  include Mongoid::Document
  include Mongoid::Timestamps

  field :template, type: Boolean, default: false
  field 
end
