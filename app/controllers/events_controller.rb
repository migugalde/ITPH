class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.user_events(current_user, params[:start], params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
    unless Event.find(params[:id]).users.include?(current_user)
      redirect_to root_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.editable = true;
    create_new_client(@event.new_name, @event.new_email)
    if @event.valid?
      @event.save
      @event.clients.each do |client|
        send_new(@event, client)
      end
    else
      flash[:success] ="I'm sorry, that is not a valid date. Please try again"
    end
  end

  def update
    oldE = Marshal::load(Marshal.dump(@event))
    @event.update(event_params)
    @event.editable = true;
    create_new_client(@event.new_name, @event.new_email)
    oldE.clients.each do |client|
      unless @event.clients.include? client
        send_cancel(oldE, client)
      else
        send_update(@event, client)
      end
    end
    @event.clients.each do |client|
      unless oldE.clients.include? client
        send_new(@event, client)
      end
    end
  end

  def destroy
    @event.clients.each do |client|
      send_cancel(@event, client)
    end
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :notes, :room_id, :new_name, :new_email, :client_ids => [], :user_ids => [])
    end

    def send_new(event, client)
      begin
          EventMailer.appointment_notification(event, client).deliver_later(queue: "high")
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, Net::OpenTimeout
        flash[:success] ="There was an error with the email server. No email was sent to #{client.name}."
      end
    end

    def send_update(event, client)
      begin
        EventMailer.appointment_update(event, client).deliver_later(queue: "low")
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, Net::OpenTimeout
        flash[:success] ="There was an error with the email server. No email was sent to #{client.name}."
      end
    end

    def send_cancel(event, client)
      begin
          EventMailer.appointment_cancel(event, client).deliver_later(queue: "low")
      rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError, Net::OpenTimeout
        flash[:success] ="There was an error with the email server. No email was sent to #{client.name}."
      end
    end

    def create_new_client(name, email)
      unless name.blank? || email.blank? || Client.where(["name = ? and email = ?", name, email]).length > 0
        new_client = Client.create(name: name, email: email)
        @event.clients << new_client
      end
    end

end
