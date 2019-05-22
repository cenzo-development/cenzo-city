class OrganisationsController < ApplicationController

  def new
    @forms_organisation_create = Forms::OrganisationCreate.new
    render :new
  end

  def create
  end




end
