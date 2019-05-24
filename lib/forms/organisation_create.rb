class Forms::OrganisationCreate

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :name, :type, :level, :phone_number, :email_address, :main_company, :vat_number, :chamber_commerce,
                :mailing_address, :mail_building_number,  :mail_post_code, :mail_place,
                :mail_building, :mail_country, :use_address_for_visiting, :billing_required, :use_address_for_billing,
                :visiting_address, :visit_building_number, :visit_post_code, :visit_place,
                :visit_building, :visit_country, :billing_address, :bill_building_number, :bill_post_code, :bill_place, :bill_building,
                :bill_country, :invoice_email_address, :reference, :destination, :contact_name, :debiteurnr



end
