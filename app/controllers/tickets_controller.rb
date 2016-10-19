class TicketsController < ApplicationController
  before_action :authenticate_user!

  def create
    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
    end
    if ticket.save
      flash[:notice] = 'このイベントに参加します'
      head201
    else
      render json: {messages: ticket.errors.full_messages }, status: 422
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id], notice: 'このイベントの参加をキャンセルしました')

  end
end
