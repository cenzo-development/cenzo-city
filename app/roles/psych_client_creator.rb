class PsychClientCreator < SimpleDelegator


  def create_client(form, client_address)
    new_client = persist!(form, client_address)
    return new_client
  end

  def persist!(form, client_address)
    self.create!({gender: form.gender,
                 deceased: form.deceased,
                 first_name: form.first_name.capitalize,
                 initials: form.initials.upcase,
                 inserts: form.inserts,
                 last_name: form.last_name.capitalize,
                 mobile_phone: form.mobile_phone,
                 work_phone: form.work_phone,
                 home_phone: form.home_phone,
                 birth_date: Date.parse(form.birth_date),
                 bsn: form.bsn,
                 email: form.email_address,
                 address: client_address
                })
  end

end
