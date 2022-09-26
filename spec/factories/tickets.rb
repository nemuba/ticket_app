# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { "MyString" }
    status { "" }
    tag { nil }
    comments { "MyText" }
  end
end
