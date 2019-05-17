

class Forms::ClientEdit
  include ActiveModel::Model
  include ActiveModel::Validations

  COUNTRIES = %w( BE BG CY DK DE EE FI FR GR HU IE IT LV LT LU MT NL AT PL PT RO SI SK ES CZ GB SE CH US)

  attr_accessor :deceased, :gender, :initials, :first_name, :inserts, :last_name,
                :bsn, :birth_date, :street_name, :house_number, :extension, :post_code,
                :place, :country, :work_phone, :mobile_phone, :home_phone, :email_address


 validates :birth_date, presence: true
 validates :last_name, presence: true
 validates :street_name, presence: true
 validates :house_number, presence: true
 validates :place, presence: true
 validates :post_code, presence: true
 validates :country, presence: true

 validate do |record|
   record.check_birth_date
 end

 validate do |record|
   record.check_post_code
 end

 validate do |record|
   record.check_country
 end

 validate do |record|
   record.check_email
 end

 validate do |record|
   record.check_bsn
 end

 def check_bsn
   if bsn.present? && !is_valid_bsn?(bsn)
     errors.add(:bsn, "voldoet niet aan elf proef")
   end
 end

 def check_birth_date
   if birth_date.present?
     begin
       Date.parse(birth_date)
     rescue
       errors.add(:birth_date, "must be of the format dd-mm-yyyy")
     end
   end
 end

def check_post_code
 if post_code.present? && in_the_netherlands? && post_code.length != 6
   errors.add(:post_code, 'must be six characters')
 end
end

def check_email
 if email_address.present? && !(!!(email_address =~ URI::MailTo::EMAIL_REGEXP))
   errors.add(:email_address, 'Email is invalid')
 end
end

def check_country
 if country.present? && !COUNTRIES.include?(country)
   errors.add(:country, 'is not valid')
 end
end

def in_the_netherlands?
 country == "NL"
end

def is_valid_bsn?(bsn)
  if bsn.length < 8 || bsn.length > 9
    return false
  end
  sum = 0
  for i in 0..bsn.length do
    if i == (bsn.length) -1
      sum += (bsn[i].to_i) * (-1)
    else
      sum += (bsn[i].to_i) * (bsn.length - i)
    end
  end

  if sum % 11 == 0
    return true
  else
    return false
  end
end

end
