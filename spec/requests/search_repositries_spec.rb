require 'rails_helper'

RSpec.describe "SearchRepositries", type: :request do
  describe "GET /list" do
    it "returns http success" do
      get "/search_repositries/list"
      expect(response).to have_http_status(:success)
    end
  end

end
