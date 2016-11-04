When(/^I enter the email as "([^"]*)"$/) do |arg1|
find(:css, "input[name='user[email]']").set(arg1)
end

When(/^I enter the password as "([^"]*)"$/) do |pw|
  find(:css, "input[name='user[password]']").set(pw)
end

Given(/^the following counselors exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |c|
    User.create!(c)
  end
end

Given(/^I login with email "(.*)" and password "(.*)"$/) do |email, password|
  find(:css, "input[name='email']").set(email)
  find(:css, "input[name='password']").set(password)
  click_button('Login')
end

Given(/^I am not logged in$/) do
  User.logged_in?.is_truthy
end
