require 'rails_helper'

RSpec.describe PasscodeController, type: :controller do

  describe "GET #confirm" do
    it "renders confirm template" do
      get :confirm
      expect(response).to render_template "confirm" 
    end
  end

end
