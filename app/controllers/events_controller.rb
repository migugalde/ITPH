class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.user_events(current_user, params[:start], params[:end])
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
    if @event.users.blank?
      @event.users = [current_user]
    end
    overlap = false
    events = Event.where(start: @event.start..@event.end, end: @event.start..@event.end)
    events.each do |e|
      if e.rooms.include?(@event.room)
        flash[:success] = "Cannot schedule two events in the same room at the same time"
        overlap = true
        break
      end
    end
    create_new_client(@event.new_name, @event.new_email)
    if @event.valid? and not overlap
      @event.save
      if @event.event_type == "counseling"
        @event.clients.each do |client|
          send_new(@event, client)
        end
      else
        flash[:success] ="I'm sorry, that is not a valid date. Please try again"
      end
    end
  end

  def update
    oldE = Marshal::load(Marshal.dump(@event))
    @event.update(event_params)
    create_new_client(@event.new_name, @event.new_email)
    if (@event.event_type == "counseling" and oldE.event_type == "counseling")
      oldE.clients.each do |client|
        unless @event.clients.include? client
          send_cancel(oldE, client)
        else
          send_update(@event, client)
        end
      end
    end
    if @event.event_type == "counseling"
      @event.clients.each do |client|
        unless oldE.clients.include? client
          send_new(@event, client)
        end
      end
      if oldE.event_type != "counseling" #no email was sent if it didnt use to be counseling
        oldE.clients.each do |client|
          unless @event.clients.include? client
            send_new(@event, client)
          end
        end
      end
    end
  end

  def destroy
    if @event.event_type == "counseling"
      @event.clients.each do |client|
        send_cancel(@event, client)
      end
    end
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :notes, :room, :weekly, :biweekly, :new_name, :new_email, :event_type, :client_ids => [], :user_ids => [])
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
        if new_client.valid?
          @event.clients << new_client
          new_client.users << @event.users
        else
          new_client.delete
          flash[:success] ="New clients need a name and a valid email"
      end
    end
  end
end