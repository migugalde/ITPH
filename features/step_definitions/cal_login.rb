When(/^I enter my email as "([^"]*)"$/) do |arg1|
  find(:css, "input[name='counselor[email]']").set(email)
end

When(/^I enter my password as "([^"]*)"$/) do |pw|
  find(:css, "input[name='counselor[password]']").set(pw)
end

Given(/^I enter my username as '(.*)'$/) do |un|
  find(:css, "input[name='counselor[username]']").set(un)
end

Given(/^the following counselors exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |c|
    User.create!(c)
  end
end
