# frozen_string_literal: true

# module CopyFile
module CopyFile
  extend ActiveSupport::Concern

  def generate_file(file_path)
    return unless file_path.present?

    file = File.read(file_path)
    new_file = File.open("./tmp/#{File.basename(file_path)}", "w")
    new_file.write(file)

    new_file.path
  ensure
    new_file.close if new_file.present?
  end
end
