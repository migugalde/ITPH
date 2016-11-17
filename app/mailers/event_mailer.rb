class EventMailer < ApplicationMailer

  #NOTE: this does one counselor, one client 
  def appointment_notification(event)
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
      mail(to: email_with_name, subject: 'Appointment reminder and intake form for ITPH')
    end
  end

  def appointment_cancel(event)
    puts "LOOK HERE"
    puts ENV["FROM_EMAIL"]
    puts "LOOK AWAY"
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
