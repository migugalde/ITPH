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
  clients.split(",, ").each do |client|
    name, email = clients.split(", ")
    event.clients << (Client.create(:name => name, :email => email))
  end
end

And(/^the event "([^"]*)" belongs the room "([^"]*)"$/) do |event_title, room|
  event = Event.find_by title: event_title
  event.room = Room.find_by name: room
end

And(/^the event "([^"]*)" has type "([^"]*)"$/) do |event_title, type|
  event = Event.find_by title: event_title
  event.event_type = ""
  event.event_type = type
end

Then(/^there should be an event with type "([^"]*)" and name "([^"]*)"$/) do |type, event_title|
  event = Event.find_by title: event_title
  expect event.event_type == type
end

Given(/^I input new_name as "([^"]*)" for "([^"]*)"$/) do |text, event_title|
  @new_name = text
  event = Event.find_by title: event_title
  event.new_name = text
end

Given(/^I input new_email as "([^"]*)" for "([^"]*)"$/) do |text, event_title|
  @new_email = text
  event = Event.find_by title: event_title
  event.new_email = text
end

Given(/^I create a new client$/) do
  new_client = Client.create(name: @new_name, email: @new_email)
end

Then(/^I should see "([^"]*)" is a client$/) do |arg1|
  expect Client.find_by name: arg1
end

