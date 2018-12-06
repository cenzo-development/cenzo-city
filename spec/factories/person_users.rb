FactoryBot.define do
  factory :person_user, class: 'Person::User' do
    password_digest { "MyString" }
    email {"harry@mail.com"}
    password {"pa$$word"}
    pass_code {"222222"}
    mobile_phone {"0685291403"}
  end
end
