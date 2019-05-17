require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  def create_empty_form(hash)
    hash.keys.each{|k| hash[k] = ''}; hash
  end

  #let(:address) {FactoryBot.create(:person_client_address)}

  let(:client) {FactoryBot.create(:person_client, address: Person::Client::Address.new)}

  let(:form_data) do
    {
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
      house_number: "78",
      extension: "A",
      bsn: "",
      post_code: "1113FK",
      country: "NL",
      place: "Purmerend"

    }

  end

  let(:edit_form){Forms::ClientEdit.new(form_data)}

  let(:invalid_form) do
    {
      gender: "2",
      deceased: "1",
      inserts: "van",
      work_phone: "0675391402",
      home_phone: "068543219",
      mobile_phone: "098331798",
      birth_date: "2",
      email_address: "mail",
      initials: "F",
      first_name: "Arrow",
      last_name: "Marbel",
      street_name: "stationweg",
      house_number: "78",
      extension: "A",
      bsn: "",
      post_code: "111",
      country: "CC",
      place: "Purmerend"

    }
  end

  let(:empty_form) {create_empty_form(form_data)}

  describe 'GET #edit' do
    it 'should render edit template' do
      get :edit, params: {id: client.id}
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it 'assigns newly created client presenter as @client_presenter' do
      get :show, params: {id: client.id}
      expect(assigns(:client_presenter)).to be_instance_of(ClientPresenter)
    end
    it 'renders the show template' do
      get :show, params: {id: client.id}
      expect(response).to render_template "show"
    end
  end

  describe 'GET #index' do
    context 'when there is no query' do
      it 'should respond with ok status' do
        get :index
        expect(response.code).to eq '200'
      end
      it 'should get list of all clients' do
        Person::Client.all.expects(:map).at_most_once
        get :index
      end
      it 'should paginate clients list' do
        get :index
        expect(assigns(:clients)).to be_instance_of(WillPaginate::Collection)
      end
      it 'should render the index template' do
        get :index
        expect(response).to render_template "index"
      end
    end
    context 'when there is a query' do
      it 'should render the search template' do
        #ClientSearchContext.expects(:call).with(client.last_name).at_most_once
        get :index, params: {query: client.last_name}
        expect(response).to render_template "search"
      end

      it 'should perform search' do
       controller.expects(:search).at_most_once
       get :index, params: {query: client.last_name}
     end
    end
  end

  describe 'POST #search' do
    context 'when query is an empty string' do
      it 'should re-direct not_found page' do
        post :search, params: {query: ''}
        expect(response).to redirect_to client_not_found_path
      end
    end
    context 'when there are no search results' do
      it 're-directs to not_found page' do
        post :search, params: {query: 'favor'}
        expect(response).to redirect_to client_not_found_path
      end
    end
    context 'when there are search results' do
      it 'should render search template' do
        post :search, params: {query: client.last_name}
        expect(response).to render_template "search"
      end
    end

  end

  describe 'PATCH #update' do
    context 'when form is valid' do
      it 're-directs to the client page' do
        patch :update, params: {forms_client_edit: form_data, commit: 'Save', id: client.id}
        expect(response).to redirect_to client_path(client.id)
      end
      it 'updates client information/data' do
          ClientUpdateContext.expects(:call).at_most_once.returns(true)
          patch :update, params: {forms_client_edit: form_data, commit: 'Save', id: client.id}
      end
      it 'assigns newly created form as @forms_client_edit' do
        patch :update, params: {forms_client_edit: form_data, commit: 'Save', id: client.id}
        expect(assigns(:forms_client_edit)).to be_instance_of(Forms::ClientEdit)
      end
    end
    context 'when form is not valid' do
      it "should re-render edit template" do
        patch :update, params: {forms_client_edit: invalid_form, commit: 'Save', id: client.id}
        expect(response).to render_template "edit"
      end
      it 'assigns validation errors as @validation_errors' do
        patch :update, params: {forms_client_edit: invalid_form, commit: 'Save', id: client.id}
        expect(assigns(:validation_errors)).to be_instance_of(ActiveModel::Errors)
      end
    end

  end
end
