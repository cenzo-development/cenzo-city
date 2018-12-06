class Person::User::Employee < Person::User
  #include Mongoid::Document

  field :manger, type: Boolean
  field :book_keeper, type: Boolean

  has_many :clients, class_name: 'Person::Client'

  validate :initials, :first_name, :last_name, presence: true
end
