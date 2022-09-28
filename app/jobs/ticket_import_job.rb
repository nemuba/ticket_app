# frozen_string_literal: true

class TicketImportJob < ApplicationJob
  def perform(file_path, user_id)
    Ticket.import(file_path, user_id)
  end
end
