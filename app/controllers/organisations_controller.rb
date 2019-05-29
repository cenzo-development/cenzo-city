class OrganisationsController < ApplicationController

  def new
    @forms_organisation_create = Forms::OrganisationCreate.new
    render :new
  end

  def create
    @forms_organisation_create = Forms::OrganisationCreate.new(organisation_param)
    if params[:commit] == 'Add Organization'
      case @forms_organisation_create.valid?
      when true
        create_new_organisation(@forms_organisation_create)
      when false
        get_validation_errors(@forms_client_create)
      end
    elsif params[:commit] == 'Cancel'
      redirect_to organisations_path
    end
  end

  def show

  end


  private

  def create_new_organisation(valid_form)
    if @new_organisation = OrganisationCreationContext.call(valid_form)
      show_message(:notice, "New organization has been successfully added", path: organisation_path(@new_organisation.id), object: self) if @new_organisation
    else
      render :new
    end
  end

  def get_validation_errors(invalid_form)
    if invalid_form.errors.any?
      @validation_errors = invalid_form.errors
    end
    render :new, forms_client_create: invalid_form, validation_errors: @validation_errors
  end

  def organisation_param
    params.require(:forms_organisation_create).permit!
  end


end
