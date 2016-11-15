class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.user_events(session[:user_id], params[:start], params[:end])
  end

  def show
  end

  def new
    @event = Event.new
    @clients = Client.all
    @users = User.all
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    EventMailer.appointment_notification(@event).deliver_later!(queue: "high")
  end

  def update
    @event.update(event_params)
  end

  def destroy
    EventMailer.appointment_cancel(@event).deliver_later!(queue: "low")
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :notes, :room, :client_ids => [], :user_ids => [])
    end
end
