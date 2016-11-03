Given(/^I should see the calendar$/) do
  page.has_css?('calendar')
end

Given(/^I am looking at the month of "(.*)-(.*)"$/) do |year, month|
	#tell page current page is month view
	date = year + month + "01";
	('#calendar').fullCalendar( 'gotoDate', date );
end

Given(/^I am looking at the day of "(.*)"$/) do |date|
	('#calendar').fullCalendar( 'gotoDate', date );
end

Then(/^I should see an error$/) do
	expect page.to_have "Sorry"
end

Then(/^I should see (.*) is scheduled in Room(\d+) on (.*)$/) do |counselor, arg1, date|
	('#calendar').fullCalendar( 'gotoDate', date );
	room = "Room"+arg1
	expect page.has_css? room
	expect page.has_css? counselor
end

Then(/^I should see "([^"]*)" has an appointment with (.*) on (.*)$/) do |client, counselor, date|
	('#calendar').fullCalendar( 'gotoDate', date );
	expect page.has_css? client
	expect page.has_css? counselor
end
