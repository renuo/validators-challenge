require 'rails_helper'

RSpec.describe "Colours", type: :request do
  describe "GET /colours" do
    it "works! (now write some real specs)" do
      get colours_path
      expect(response).to have_http_status(200)
    end
  end
end
