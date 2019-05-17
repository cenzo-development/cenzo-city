require 'rails_helper'

RSpec.describe PsychClientController, type: :controller do
  client_form_data = {
    gender: "2",
    deceased: "1",
    inserts: "van",
    work_phone: "0675391402",
    home_phone: "068543219",
    mobile_phone: "098331798",
    birth_date: "23-10-1983",
    email_address: "mail@host.com",
    initials: "F",
    first_name: "Arrow",
    last_name: "Marbel",
    street_name: "stationweg",
    house_number: "24",
    extension: "A",
    bsn: "1766334",
    post_code: "1441EJ",
    country: "NL",
    place: "Purmerend"

  }

  invalid_client_form_data = {
    gender: nil,
    deceased: "1",
    inserts: "van",
    work_phone: "0675391402",
    home_phone: "068543219",
    mobile_phone: "098331798",
    birth_date: nil,
    email_address: "mail@host.com",
    initials: "F",
    first_name: nil,
    last_name: nil,
    street_name: nil,
    house_number: nil,
    extension: "A",
    bsn: "1766334",
    post_code: "1113FK",
    country: "NL",
    place: nil

  }

  let(:valid_form) {Forms::ClientCreate.new(client_form_data)}


  describe 'POST #create' do
    context 'form with all fields present' do
      it 'creates a new client' do
        PsychClientCreationContext.expects(:call).with(valid_form).at_most_once
        post :create, params: {:forms_client_create => client_form_data}
      end
      it 'assigns a newly created form as @new_client_form' do
        post :create, params: {:forms_client_create => client_form_data}
        expect(assigns(:forms_client_create)).to be_instance_of(Forms::ClientCreate)
      end
      it 'submits a valid form' do
        post :create, params: {:forms_client_create => client_form_data}
        expect(controller.instance_variable_get(:@forms_client_create).send(:valid?)).to be true
      end
      it 'assigns a newly created client as @new_client' do
        post :create, params: {:forms_client_create => client_form_data, :commit => "Add Client"}
        expect(assigns(:new_client)).to eq nil
      end
      it 're-directs to the newly created client page' do
        post :create, params: {:forms_client_create => client_form_data}
        client_id = controller.instance_variable_get(:@new_client).send(:id)
        expect(response).to redirect_to client_path(client_id)
      end

    end

    context 'form with required fields absent' do
      it 'signals validation error' do
          post :create, params: {:forms_client_create => invalid_client_form_data}
          expect(controller.instance_variable_get(:@new_client_form).send(:errors).count).to be > 0
      end
    end
  end

end
