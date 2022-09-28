# frozen_string_literal: true

# module ExportCSV
module ExportCsv
  extend ActiveSupport::Concern

  # module ClassMethods
  module ClassMethods
    def to_csv
      require "csv"
      options = { col_sep: ";", encoding: "utf-8" }
      headers = %i[id user_id title current_status comments]

      CSV.generate(headers: true, **options) do |csv|
        csv << headers

        all.each do |ticket|
          csv << [ticket.id, ticket.user_id, ticket.title, ticket.current_status, ticket.comments]
        end
      end
    end
  end
end
