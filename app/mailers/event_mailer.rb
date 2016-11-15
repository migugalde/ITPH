class EventMailer < ApplicationMailer

  #NOTE: this does one counselor, one client 
  def appointment_notification(event)
    @event = event
    @intake_form = "goo.gl/GV3mBe"
    @office_location  = "533 Peters Ave, Ste 500, Pleasanton, CA"
    @counselors = @event.user.name
    email_with_name = %("#{@event.client.name}" <#{@event.client.email}>)
    mail(to: email_with_name, subject: 'Appointment reminder and intake form for ITPH')
  end
end
