Feature: Scheduling an Appointment
	As a counselor
	So that I can schedule an appointment with my client
	I want to quickly book using autofill for common room bookings and clients

Background: counselor has been logged in
	Given I am logged in as Toni
	When today is "12.01.2016"
	And the time is "9:07am"
	Given the following clients exist:
	| name		| counselor	| email 			|
	| Bob Smith	| Toni 		| bob@smith.net 	|
	And I am on the home page

Scenario: I want to have most fields autofilled for a counseling appointment
	When I click "Schedule an appointment"
	And I fill in "Client Name" with "Ave Maria"
	And I click "Confirm"
	Then I should see a message "Successfully scheduled counseling appointment for Toni with Ave Maria on December 01 at 10:00am in Room A"

Scenario: I want to have a clients email autofilled when I enter his name
	When I click "Schedule an appointment"
	And I fill in "Client Name" with "Bob Smith"
	Then I should see "Client Email" is "bob@smith.net"
	And I click "Confirm"
	Then I should see a message "Successfully scheduled counseling appointment for Toni with Bob Smith on December 01 at 10:00am in Room A"