require 'rails_helper'

RSpec.describe OrganisationsController, type: :controller do

  let(:organization_form_data) do
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
      visit_address: "yes",
      billing_data: "no",
      bill_address: "yes",
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


  let(:new_organization) {Organisation.new}

  describe 'POST #create' do
    it 'assigns a newly created form as @new_organisation_form' do
      post :create, params: {:forms_organisation_create => organization_form_data, :commit => "Add Organization"}
      expect(assigns(:forms_organisation_create)).to be_instance_of(Forms::OrganisationCreate)
    end
    context 'when form is valid' do
      it 'assigns newly created organisation as @new_organisation' do
        post :create, params: {:forms_organisation_create => organization_form_data, :commit => 'Add Organization'}
        expect(assigns(:new_organisation)).to be_instance_of(Organisation)
      end

      it 're-directs to newly created organisation page' do
        post :create, params: {:forms_organisation_create => organization_form_data, :commit => 'Add Organization'}
        org_id = subject.instance_variable_get(:@new_organisation).send(:id)
        expect(response).to redirect_to(organisation_path(org_id))
      end
      context 'when form is invalid' do
        it 're-renders new template' do
        end
        it 'signals validation error'
      end
    end

  end






end
