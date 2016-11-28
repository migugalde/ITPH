class EventMailer < ApplicationMailer
  @intake_form = ENV["INTAKE_FORM"]
  @office_location  = ENV["OFFICE_LOC"]

  def return_counselor_lists(event_users)
    @counselors = ""
    event_users.each do | counselor|
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
    return @counselors
  end

  #NOTE: this does one counselor, one client
  def appointment_notification(event, client)
    @event = event
    @counselors = return_counselor_lists(@event.users)
    @name = client.name
    email_with_name = %("#{client.name}" <#{client.email}>)
    mail(to: email_with_name, subject: 'Appointment reminder and intake form for ITPH')
  end

  def appointment_cancel(event, client)
    @event = event
    @counselors = return_counselor_lists(@event.users)
    @name = client.name
    email_with_name = %("#{client.name}" <#{client.email}>)
    mail(to: email_with_name, subject: 'Appointment cancellation notification for ITPH')
  end

end
