class PsychClientController < ApplicationController

  def new
    @forms_client_create = Forms::ClientCreate.new
  end

  def create
    @forms_client_create = Forms::ClientCreate.new(client_params)
    if params[:commit] == "Add Client"
      case @forms_client_create.valid?
      when true
        create_new_client(@forms_client_create)
      when false
        get_validation_errors(@forms_client_create)
        render :new, forms_client_create: @forms_client_create, validation_errors: @validation_errors
      end
    elsif params[:commit] == "Cancel"
      redirect_to clients_path
    end
  end

  private

  def create_new_client(valid_form)
    @new_client = PsychClientCreationContext.call(valid_form)
    show_message(:notice, "New client has been successfully added", path: client_path(@new_client.id), object: self) if @new_client
    #show_message(:error, "Server error: unable to add new client at this time")
  end

  def get_validation_errors(invalid_form)
    @validation_errors = invalid_form.errors
  end

  def client_params
    params.require(:forms_client_create).permit!
  end


end
