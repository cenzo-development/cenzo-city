require 'will_paginate/array'

class ClientsController < ApplicationController

  def index
    if params[:query]
      @q = params[:query]
      search
      return
    end
    clients = Person::Client.all.map{|c| ClientPresenter.new(c)}
    @clients = clients.paginate(page: params[:page], per_page: 8)
    render :index
  end

  def show
    client = Person::Client.find(params[:id])
    @client_presenter = ClientPresenter.new(client)
  end

  def edit
    @client = Person::Client.find(params[:id])
    @forms_client_edit = Forms::ClientEdit.new
    get_edit_form_data(@client)
    render :edit
  end

  def not_found
  end

  def update
    @forms_client_edit = Forms::ClientEdit.new(client_params)

    if params[:commit] == 'Save'
      case valid_form
      when true
        update_client(params[:id], @forms_client_edit)
      when false
        get_validation_errors(@forms_client_edit)
      end
    elsif params[:commit] == 'Cancel'
      redirect_to clients_path
    end
  end


  def search
    search_results = ClientSearchContext.call(params[:query])
    @q = params[:query]
    if search_results.present? && params[:query].present?
      clients = search_results.map{|result| ClientPresenter.new(result)}
      @search_results = clients.paginate(page: params[:page], per_page: 8)
      render :search
    else
      redirect_to client_not_found_path
    end
  end

  private

  def update_client(client_id, valid_client_form)
    if ClientUpdateContext.call(client_id, valid_client_form)
      show_message(:notice, "Client was successfully updated", path: client_path(client_id), object: self)
    end
  end

  def get_validation_errors(invalid_form)
    if invalid_form.errors.any?
      @validation_errors = invalid_form.errors
    end
    render :edit, forms_client_edit: invalid_form, validation_errors: @validation_errors
  end

  def valid_form
    @forms_client_edit.valid?
  end

  def get_edit_form_data(client)
    @deceased = client.deceased
    @male = "1" if client.gender == 1
    @female = "0" if client.gender == 0
    @initials = client.initials
    @inserts = client.inserts
    @last_name = client.last_name
    @first_name = client.first_name
    @bsn = client.bsn if client.respond_to? :bsn
    @birth_date = I18n.l(client.birth_date)
    @email_address = client.email
    @work_phone = client.work_phone
    @mobile_phone = client.mobile_phone
    @home_phone = client.home_phone

    if client.address.present?
      @street_name = client.address.address
      @place = client.address.city
      @country = client.address.country
      @house_number = client.address.house_number
      @extension = client.address.house_number_extension
      @post_code = client.address.zipcode
    end

  end


  def client_params
    params.require(:forms_client_edit).permit!
  end
end
