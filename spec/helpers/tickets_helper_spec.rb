# frozen_string_literal: true

require "rails_helper"

RSpec.describe TicketsHelper, type: :helper do
  describe "status_class" do
    it "pending" do
      expect(helper.status_class("pending")).to eq("bg-warning p-1 rounded text-white")
    end

    it "completed" do
      expect(helper.status_class("completed")).to eq("bg-success p-1 rounded text-white")
    end

    it "removed" do
      expect(helper.status_class("removed")).to eq("bg-danger p-1 rounded text-white")
    end
  end
end
