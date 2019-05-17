class ClientPresenter < SimpleDelegator
  def client_name
    "#{self.initials} #{self.inserts} #{self.last_name} (#{get_gender})"
  end

  def client_number
    self.number
  end

  def client_dob
    I18n.l(birth_date)
  end

  def client_bsn
    if self.respond_to? :bsn
      return bsn.blank? ? "N/A" : bsn
    else
      return "N/A"
    end
  end

  def client_email
    if self.email.present?
      return email
    else
      return "N/A"
    end
  end

  def client_work_phone
    return "N/A" unless self.work_phone.present?
    format_phone_number(self.work_phone)
  end

  def client_mobile_phone
    return "N/A" unless self.mobile_phone.present?
    format_phone_number(self.mobile_phone)
  end

  def client_home_phone
    return "N/A" unless self.home_phone.present?
    format_phone_number(self.home_phone)
  end

  def client_address
    if self.address.present?
      return [self.address.address, self.address.house_number, self.address.city, self.address.zipcode]
    end
  end

  def format_phone_number(num)
    "#{num[0..2]}" + " " "#{num[3..5]}" + " " "#{num[6..9]}"
  end

  def get_gender
    case self.gender
    when 0
      return 'v'
    when 1
      return 'm'
    end
  end

  private :format_phone_number, :get_gender

end
