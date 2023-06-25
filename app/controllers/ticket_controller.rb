class TicketController < ApplicationController
  def index
    @tickets = Ticket.all
  end
end
