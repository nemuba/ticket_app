# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tickets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/tickets"
      expect(response).to have_http_status(:success)
    end
  end
end
