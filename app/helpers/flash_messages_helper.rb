# frozen_string_literal: true

module FlashMessagesHelper
  HEADERS = {
    create: "toast-header bg-primary text-white",
    update: "toast-header bg-success text-white",
    destroy: "toast-header bg-danger text-white",
  }.freeze

  def toast_header(action)
    HEADERS[action.to_sym]
  end
end
