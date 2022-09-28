# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ticket, type: :model do
  subject { build(:ticket) }

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:current_status) }
    it { should validate_presence_of(:comments) }
  end
end
