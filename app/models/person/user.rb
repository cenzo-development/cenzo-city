class Person::User < Person
  #include Mongoid::Document
  include ActiveModel::SecurePassword

  field :pass_code, type: String
  field :set_new_password_at_next_logon, type: Boolean, default: false
  field :password_digest, type: String
  field :password_reset_token, type: String
  field :password_reset_sent_at, type: Time
  field :role, type: String

  has_secure_password

end
