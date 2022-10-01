# frozen_string_literal: true

require "csv"

# module ImportCsv
module ImportCsv
  extend ActiveSupport::Concern

  # module ClassMethods
  module ClassMethods
    def import(file_path, user_id)
      return unless File.exist?(file_path)

      CSV.foreach(file_path, headers: true, col_sep: ";") do |row|
        record = find_by(id: row.field("id"), user_id: user_id) || new(user_id: user_id)
        record.attributes = row.to_hash.except("id", "user_id")
        record.save!
      end
    rescue StandardError => e
      puts e.message
    ensure
      File.delete(file_path) if  file_path.present? && File.exist?(file_path)
    end
  end
end
