# frozen_string_literal: true

class TicketsController < ApplicationController
  include CopyFile

  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @tickets = if params[:search].present?
      pagy(Ticket.by_user(current_user).search(params[:search]), items: 10, link_extra: "data-turbo-stream=''")
    else
      pagy(Ticket.by_user(current_user), items: 10, link_extra: "data-turbo-stream=''")
    end
  end

  def new
    @ticket = Ticket.new
  end

  def show; end

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

  def download
    respond_to do |format|
      format.csv { send_data Ticket.to_csv(current_user), filename: "tickets.csv" }
    end
  end

  def import
    respond_to do |format|
      if params[:file].present?
        file_path = generate_file(params[:file].path)

        TicketImportJob.perform_later(file_path, current_user.id)
        format.html { redirect_to tickets_path }
        format.turbo_stream
      else
        format.html { redirect_to tickets_path }
        format.turbo_stream
      end
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:title, :current_status, :comments, :user_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
