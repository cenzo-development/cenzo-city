class OrganisationCreationContext
  def self.call(org_form)
    new(org_form).call
  end

  def initialize(form)
    @org_form = form
    @org_mail_address = Organisation::Address.new({
      address: form.mailing_address,
      building_number: form.mail_building_number,
      zipcode: form.mail_post_code,
      country: form.mail_country,
      building_name: form.mail_building,
      city: form.mail_place
      })

   assign_organisation_creator(Organisation)
  end

  def call
    @decorated_object.create_org(@org_form, @org_mail_address)
  end

  private

  def assign_organisation_creator(org)
    @decorated_object = OrganisationCreator.new(org)
  end

end
