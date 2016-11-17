Given(/^the following events exist:$/) do |table|
  pending
  table.hashes.each do |event|
    Event.create!(event)
  end
end

And(/^the event "([^"]*)" has the following counselors:(.*)$/) do |event_title, counselors|
  pending
  event = Event.find_by title: event_title
  counselors.split(/\s*,\s*/).each do |counselor|
    event.users << (User.find_by email: counselor)
  end
end

And(/^the event "([^"]*)" has the following clients:(.*)$/) do |event_title, clients|
  pending
  event = Event.find_by title: event_title
  clients.split(/\s*,\s*/).each do |client|
    event.users << (Client.find_by email: client)
  end
end

Given(/^I click on "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I want to create an event$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I open the page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I input title as "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I input name as "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I input email as "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" should recieve an email$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I input recurring as "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^"([^"]*)" should not recieve an email$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
