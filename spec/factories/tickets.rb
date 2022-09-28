# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    user_id { create(:user).id }
    title { "MyString" }
    current_status { ["pending", "completed", "removed"].sample }
    comments { "MyText" }
  end
end
