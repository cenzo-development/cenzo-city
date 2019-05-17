class MiscController < ApplicationController

  def check_address
    result = AddressVerifier.check_address(params[:postcode], params[:number])
    if result
      render json: result
    end
  end

end
