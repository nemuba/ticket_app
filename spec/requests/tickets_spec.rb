# frozen_string_literal: true

require "rails_helper"

RSpec.describe "TicketsController", type: :request do
  let(:user) { create(:user) }
  let(:ticket) { create(:ticket) }
  let(:ticket_params) { { ticket: attributes_for(:ticket) } }

  before(:each) { sign_in(user) }

  describe "GET #index" do
    before { get tickets_path }

    it { expect(response).to have_http_status(:success) }
  end

  describe "GET #show" do
    before { get ticket_path(ticket) }

    it { expect(response).to have_http_status(:success) }
  end

  describe "GET #edit" do
    before { get edit_ticket_path(ticket) }

    it { expect(response).to have_http_status(:success) }
  end

  describe "POST #create" do
    it "is expected to respond with a success status code (2xx)" do
      post tickets_path(format: :turbo_stream), params: ticket_params
      expect(response).to have_http_status(:success)
    end

    it "is expected count ticket by 1" do
      expect { post tickets_path(format: :turbo_stream), params: ticket_params }.to change { Ticket.count }.by(1)
    end
  end

  describe "PATCH #update" do
    it "is expected to respond with a success status code (2xx)" do
      patch ticket_path(ticket, format: :turbo_stream), params: ticket_params
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "is expected to respond with a success status code (2xx)" do
      delete ticket_path(ticket, format: :turbo_stream)
      expect(response).to have_http_status(:success)
    end

    it "is expected count ticket by -1" do
      ticket = create(:ticket)
      expect { delete ticket_path(ticket, format: :turbo_stream) }.to change { Ticket.count }.by(-1)
    end
  end
end
