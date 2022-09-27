# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: [:edit, :update, :destroy]

  def index
    @pagy, @tickets = pagy(Ticket.order(:created_at), items: 10, link_extra: "data-turbo-stream=''")
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to tickets_url }
        format.turbo_stream
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.turbo_stream
      else
        format.turbo_stream { render :form_update, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @ticket.destroy
        format.html { redirect_to tickets_url }
        format.turbo_stream
      else
        format.turbo_stream
      end
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:title, :current_status, :comments)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
