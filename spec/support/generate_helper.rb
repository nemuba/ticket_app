# frozen_string_literal: true

require "csv"

module GenerateHelper
  def csv_file(file_path)
    headers = ["id", "user_id", "title", "current_status", "comments"]
  
    CSV.open(file_path, "wb", col_sep: ";", encoding: "utf-8") do |csv|
      csv << headers
      3.times do |e|
        csv << [
          Faker::Number.number(digits: 1),
          Faker::Number.number(digits: 1),
          Faker::String.random(length: 20),
          ["pending", "completed", "removed"].sample,
          Faker::String.random,
        ]
      end
    end
  end
end
