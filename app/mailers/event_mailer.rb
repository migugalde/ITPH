class EventMailer < ApplicationMailer

  #NOTE: this does one counselor, one client 
  def appointment_notification(event, client)
    @event = event
    @intake_form = ENV["INTAKE_FORM"]
    @office_location  = ENV["OFFICE_LOC"]
    @counselors = ""
    @event.users.each do | counselor|
      if counselor == @event.users.last
        if counselor != @event.users.first
          @counselors += " and "
        end
        @counselors += counselor.name
      elsif counselor != @event.users.first
        @counselors += counselor.name + ", "
      else
        @counselors += counselor.name
      end
    end
    @name = client.name
    puts "LOOK HERE TOO"
    puts @name
    puts client.email
    email_with_name = %("#{client.name}" <#{client.email}>)
    mail(to: email_with_name, subject: 'Appointment reminder and intake form for ITPH')
  end

  def appointment_cancel(event, client)
    @event = event
    @intake_form = ENV["INTAKE_FORM"]
    @office_location  = ENV["OFFICE_LOC"]
    @counselors = ""
    @event.users.each do | counselor|
      @counselors += counselor.name
    end
    @event.clients.each do |client|
      @name = client.name
      email_with_name = %("#{client.name}" <#{client.email}>)
      mail(to: email_with_name, subject: 'Appointment cancellation notification for ITPH')
    end
  end

end
