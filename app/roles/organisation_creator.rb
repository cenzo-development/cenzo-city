class OrganisationCreator < SimpleDelegator
  def create_org(form, org_mail_address)
    org_visit_address = case form.use_address_for_visiting
    when 'yes'
      org_mail_address.clone
    when 'no'
      create_visit_address(form)
    end
    org_billing_address = case form.use_address_for_billing
    when 'yes'
      org_mail_address.clone
    when 'no'
      create_bill_address(form)
    end
    new_client = persist!(form, org_mail_address, org_visit_address, org_billing_address)
    return new_client
  end

  private

  def persist!(form, address_mail, address_visit, address_billing)
    case is_billing_required?(form)
    when true
      return self.create!({
        name: form.name,
        level: form.level,
        type: form.type,
        main_company: form.main_company,
        vat_number: form.vat_number,
        chamber_commerce: form.chamber_commerce,
        phone_number: form.phone_number,
        email: form.email_address,
        invoice_email: form.invoice_email,
        destination: form.destination,
        contact_name: form.contact_name,
        reference: form.reference,
        debiteurnr: form.debiteurnr,
        mailing_address: address_mail,
        visiting_address: address_visit,
        billing_address: address_billing
        })
      when false
        return self.create!({
          name: form.name,
          level: form.level,
          type: form.type,
          main_company: form.main_company,
          vat_number: form.vat_number,
          chamber_commerce: form.chamber_commerce,
          phone_number: form.phone_number,
          email: form.email_address,
          mailing_address: address_mail,
          visiting_address: address_visit,
          billing_address: address_billing
        })
      end
    end
    
    def create_visit_address(form)
      Organisation::Address.new({
        address: form.visiting_address,
        building_number: form.visit_building_number,
        zipcode: form.visit_post_code,
        building: form.visit_building,
        country: form.visit_country,
        city: form.visit_place
        })
      end

      def create_bill_address(form)
        Organisation::Address.new({
          address: form.visiting_address,
          building_number: form.visit_building_number,
          zipcode: form.visit_post_code,
          building: form.visit_building,
          country: form.visit_country,
          city: form.visit_place
          })
        end

        def is_billing_required?(form)
          form.billing_required == 'yes'
        end
end
