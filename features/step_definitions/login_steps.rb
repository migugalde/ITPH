Given(/^the following counselors exist:$/) do |table|
  table.hashes.each do |counselor|
      Counselor.create(counselor)
  end
end

When(/^I type "([^"]*)" in the "([^"]*)" field$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be redirected to the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should stay on the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the message "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end