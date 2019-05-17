class ClientUpdater < SimpleDelegator

  def update_client(form)
    self.first_name = form.first_name.capitalize if form.first_name.present?
    self.last_name = form.last_name.capitalize if form.last_name.present?
    self.inserts = form.inserts if form.inserts.present?
    self.initials = form.initials.upcase if form.initials.present?
    self.gender = form.gender
    self.deceased = form.deceased if form.deceased.present?
    self.email = form.email_address if form.email_address.present?
    self.mobile_phone = form.mobile_phone if form.mobile_phone.present?
    self.home_phone = form.home_phone if form.home_phone.present?
    self.work_phone = form.work_phone if form.work_phone.present?
    self.birth_date = Date.parse(form.birth_date) if form.birth_date.present?

   if self.respond_to? :bsn
      self.bsn = form.bsn if form.bsn.present?
    end

    unless self.address.blank?
      self.address.address = form.street_name.capitalize if form.street_name.present?
      self.address.zipcode = form.post_code if form.post_code.present?
      self.address.house_number = form.house_number if form.house_number.present?
      self.address.house_number_extension = form.extension if form.extension.present?
      self.address.city = form.place.capitalize if form.place.present?
      self.address.country = form.country if form.country.present?
    end

    self.save
  end

end
