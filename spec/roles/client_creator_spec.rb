require 'rails_helper'

describe OrganisationCreator do
  let(:org_data_form) do
    {
      name: "Jumbo",
      type: "1",
      level: "3",
      phone_number: "0675391402",
      email_address: "aol@example.com",
      vat_number: "0098665",
      chamber_commerce: "1143557",
      mailing_address: "stationweg",
      mail_building_number: "24",
      mail_post_code: "1366EJ",
      mail_place: "Purmerend",
      mail_building: '',
      mail_country: "NL",
      visit_address: "Yes",
      billing_data: "No",
      bill_address: "Yes",
      visiting_address: '',
      visit_building_number: '',
      visit_post_code: '',
      visit_building: '',
      visit_country: '',
      billing_address: '',
      bill_building_number: '',
      bill_place: '',
      bill_building: '',
      bill_post_code: '',
      bill_country: '',
      invoice_email_address: '',
      reference: '',
      destination: '',
      contact_name: '',
      debiteurnr: ''
    }

  end

  let(:org_data_form_two) do
    {
      name: "Jumbo",
      type: "1",
      level: "3",
      phone_number: "0675391402",
      email_address: "aol@example.com",
      vat_number: "0098665",
      chamber_commerce: "1143557",
      mailing_address: "stationweg",
      mail_building_number: "24",
      mail_post_code: "1366EJ",
      mail_place: "Purmerend",
      mail_building: '',
      mail_country: "NL",
      visit_address: "No",
      billing_data: "No",
      bill_address: "No",
      visiting_address: '',
      visit_building_number: '',
      visit_post_code: '',
      visit_building: '',
      visit_country: '',
      billing_address: '',
      bill_building_number: '',
      bill_place: '',
      bill_building: '',
      bill_post_code: '',
      bill_country: '',
      invoice_email_address: '',
      reference: '',
      destination: '',
      contact_name: '',
      debiteurnr: ''
    }
  end

  let(:mail_address){Organisation::Address.new}
  let(:form){Forms::OrganisationCreate.new(org_data_form)}
  let(:form_two){Forms::OrganisationCreate.new(org_data_form_two)}

  describe '#create_org' do
    it 'creates a new organization' do
      org_creator = OrganisationCreator.new(Organisation)
      org = org_creator.create_org(form, mail_address)
      expect(org).not_to be_nil
      expect(org).to be_instance_of(Organisation)
    end

    it 'creates mailing, visiting and billing addresses' do
      org_creator = OrganisationCreator.new(Organisation)
      org = org_creator.create_org(form, mail_address)
      expect(org.mailing_address).to eq mail_address
      expect(org.visiting_address).not_to be_nil
      expect(org.billing_address).not_to be_nil
    end
    context 'mailing address is used for visiting and billing' do
      it 'duplicates mailing address for visiting address' do
        org_creator = OrganisationCreator.new(Organisation)
        org = org_creator.create_org(form, mail_address)
        expect(org.visiting_address).to eq org.mailing_address
      end
      it 'duplicates mailing address for billing address' do
        org_creator = OrganisationCreator.new(Organisation)
        org = org_creator.create_org(form, mail_address)
        expect(org.billing_address).to eq org.mailing_address
      end
    end
    context 'visiting and billing addresses are different from mailing address ' do
      it "creates a new address for visiting" do
        org_creator = OrganisationCreator.new(Organisation)
        org = org_creator.create_org(form_two, mail_address)
        expect(org.visiting_address == org.mailing_address).to eq false
      end
      it 'creates a new address for billing' do
        org_creator = OrganisationCreator.new(Organisation)
        org = org_creator.create_org(form_two, mail_address)
        expect(org.billing_address == org.mailing_address).to eq false
      end
    end
  end

end
