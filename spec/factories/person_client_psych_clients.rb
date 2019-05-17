FactoryBot.define do
  factory :person_client_psych_client, class: 'Person::Client::PsychClient' do
    gender {2}
    deceased {1}
    inserts {"van"}
    work_phone {"0675391402"}
    home_phone {"068543219"}
    mobile_phone {"098331798"}
    birth_date {"23-10-1983"}
    email {"mail@host.com"}
    initials {"F"}
    first_name {"Vergil"}
    last_name {"Marbel"}
  end
end
