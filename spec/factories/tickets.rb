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
FactoryBot.define do
  factory :ticket do
    user_id { create(:user).id }
    title { "MyString" }
    current_status { ["pending", "completed", "removed"].sample }
    comments { "<h1>MyText</h1>" }
  end
end
