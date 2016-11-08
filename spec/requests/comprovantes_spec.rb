require 'rails_helper'

RSpec.describe "Comprovantes", type: :request do
  describe "GET /comprovantes" do
    it "works! (now write some real specs)" do
      get comprovantes_path
      expect(response).to have_http_status(200)
    end
  end
end
