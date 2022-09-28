# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlashMessagesHelper, type: :helper do
  describe "toast_header" do
    it "create" do
      expect(helper.toast_header("create")).to eq("toast-header bg-primary text-white")
    end

    it "update" do
      expect(helper.toast_header("update")).to eq("toast-header bg-success text-white")
    end

    it "destroy" do
      expect(helper.toast_header("destroy")).to eq("toast-header bg-danger text-white")
    end
  end
end
