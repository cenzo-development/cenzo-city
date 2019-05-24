class OrganisationsController < ApplicationController

  def new
    @forms_organisation_create = Forms::OrganisationCreate.new
    render :new
  end

  def create
    if params[:commit] == 'Add Organization'
      @forms_organisation_create = Forms::OrganisationCreate.new(organisation_param)
      @new_organisation = OrganisationCreationContext.call(@forms_organisation_create)
      redirect_to organisation_path(@new_organisation.id)
    end   
  end

  def show

  end


  private

  def organisation_param
    params.require(:forms_organisation_create).permit!
  end




end
