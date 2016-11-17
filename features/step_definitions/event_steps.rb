Given(/^the following events exist:$/) do |table|
  table.hashes.each do |event|
    Event.create!(event)
  end
end

And(/^the event "([^"]*)" has the following counselors: (.*)$/) do |event_title, counselors|
  event = Event.find_by title: event_title
  event.users = []
  counselors.split(/\s*,\s*/).each do |counselor|
    event.users << (User.find_by email: counselor)
  end
end

And(/^the event "([^"]*)" has the following clients:(.*)$/) do |event_title, clients|
  event = Event.find_by title: event_title
  event.clients = []
  clients.split(/\s*,\s*/).each do |name, email|
    event.clients << (Client.create(:name => name, :email => email))
  end
end
