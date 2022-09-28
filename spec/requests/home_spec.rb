# frozen_string_literal: true

require "rails_helper"

RSpec.describe "HomeController", type: :request do
  describe "GET #index" do
    before { get root_path }

    it { expect(response).to have_http_status(:success) }
  end
end
