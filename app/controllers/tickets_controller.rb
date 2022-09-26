# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @pagy, @tickets = pagy(Ticket, items: 10, link_extra: "data-turbo-stream=''")
  end
end
