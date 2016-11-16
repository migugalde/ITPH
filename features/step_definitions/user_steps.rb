Given(/^the following counselors exist:$/) do |table|
  table.hashes.each do |c|
    User.create!(c)
  end
end

Given(/^I login with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given(/^I am logged in as "([^"]*)" with password "([^"]*)"$/) do |email, password|
  visit "/users/sign_in"
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Log in"
end

And(/^I fill in the passwords with "([^"]*)"$/) do |password|
  fill_in "Password", with: password, :match => :prefer_exact
  fill_in "Password confirmation", with: password, :match => :prefer_exact
end

Then(/^the user "([^"]*)" should exist$/) do |email|
  expect(User.find_by email: email).to_not be_nil
end

Then(/^the user "([^"]*)" should not exist$/) do |email|
  expect(User.find_by email: email).to be_nil
end

Then(/^the "([^"]*)" of "([^"]*)" should be "([^"]*)"$/) do |field, email, value|
  expect((User.find_by email: email).send(field.to_sym)).to eq(value)
end
