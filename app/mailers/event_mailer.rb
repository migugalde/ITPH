class EventMailer < ApplicationMailer

  #NOTE: this does one counselor, one client 
  def appointment_notification(event)
    @event = event
    @intake_form = "goo.gl/GV3mBe"
    @office_location  = ENV["OFFICE_LOC"]
    @counselors = @event.counselor_name
    email_with_name = %("#{@event.client_name}" <#{@event.client_email}>)
    mail(to: email_with_name, subject: 'Appointment reminder and intake form for ITPH')
  end

  def appointment_cancel(event)
    @event = event
    @intake_form = "goo.gl/GV3mBe"
    @office_location  = ENV["OFFICE_LOC"]
    @counselors = @event.counselor_name
    email_with_name = %("#{@event.client_name}" <#{@event.client_email}>)
    mail(to: email_with_name, subject: 'Appointment cancellation notification for ITPH')
  end

end
