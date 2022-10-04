# frozen_string_literal: true

# == Schema Information
#
# Table name: tickets
#
#  id             :bigint           not null, primary key
#  current_status :enum             default("pending"), not null
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
require "rails_helper"

RSpec.describe Ticket, type: :model do
  subject { build(:ticket) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_rich_text(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:current_status) }
  end

  describe "ClassMethods" do
    let(:user) { create(:user) }
    let(:file_path) { "./tmp/temp.csv" }
    before(:each) { csv_file(file_path) }

    it "#import" do
      expect { Ticket.import(file_path, user.id) }.not_to raise_error
    end

    it "#to_csv" do
      expect { Ticket.to_csv(user) }.not_to raise_error
    end
  end
end
