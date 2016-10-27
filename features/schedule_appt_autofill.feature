Feature: Scheduling an Appointment
	As a counselor
	So that I can schedule an appointment with my client
	I want to quickly book using autofill for common room bookings

Background: counselor has been logged in
	Given I am logged in as Toni
	And I am on the home page
	When today is "12.01.2016"
	And the time is "9:07am"

Scenario: I want to have most fields autofilled for a counseling appointment
	When I click "Schedule an appointment"
	And I fill in "Clients" with "Ave Maria"
	And I click "Confirm"
	Then I should see a message "Successfully scheduled counseling appointment for Toni with Ave Maria on December 01 at 10:00am in Room A"