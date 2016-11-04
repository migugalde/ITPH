Given(/^the following clients exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |client|
    Client.create!(client)
  end
end

Then(/^I should see the phone number is (\d{3}-\d{3}-\d{4})$/) do |date|
  expect(page.should have_content date)
end

Then(/^I should see the counselor is (.*)$/) do |counselor|
  expect(page.should have_content counselor)
end

Then(/^I change the name to (.*)$/) do |name|
  find(:css, "input[name='client[name]']").set(name)
end

Then(/^I change the counselor to (.*)$/) do |c|
  find(:css, "input[name='client[counselor]']").set(c)
end

Then(/^I change the phone number to (\d{3}-\d{3}-\d{4})$/) do |phone|
  find(:css, "input[name='client[phone_number]']").set(phone)
end

Then(/^I change the email to "([^"]*)"$/) do |client_email|
  find(:css, "input[name='client[email]']").set(client_email)
end

Then(/^I should see the email is "([^"]*)"$/) do |email|
  expect(page.should have_content email)
end

Then(/^I should see the following emails:(.*)$/) do |email_list|
  email_list.split(", ").each do |email|
      expect(page.should have_content email)
  end
end

Then(/^I should see no upcoming appointments$/) do
  expect page.should_not have_content "Next Appointment"
end

