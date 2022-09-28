# frozen_string_literal: true

module TicketsHelper
  STATUS = {
    pending: "bg-warning p-1 rounded text-white",
    completed: "bg-success p-1 rounded text-white",
    removed: "bg-danger p-1 rounded text-white",
  }.freeze

  def status_class(status)
    STATUS[status.to_sym]
  end
end
