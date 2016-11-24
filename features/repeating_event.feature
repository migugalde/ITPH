Feature: Scheduling an Appointment
	As a counselor
	So that I can schedule an appointment with my client
	I want to quickly book an empty room

Background: counselor has been logged in
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|

	And the following appointments exist:
	| Counselor | Type       | Room | Client    	| Date 		| Time 		| Repetition	|
	| Toni		| counseling | A 	| Bob Smith		| 12.12.2016| 11:00am 	| None		|
	| Yolanda	| counseling | B 	| White Hat		| 12.12.2016| 11:00pm	| Weekly	|
	| Anna		| counseling | B 	| Danny Boy		| 12.12.2016| 11:00am	| Bi-Weekly	|

	And I am logged in as "toni@gmail.com" with password "password"
	And I am on the home page

Scenario: I want to schedule a weekly, repeating appointment
	When I press "Schedule an appointment"
	And I fill in "Client Name" with "Zany Sue"
	And I fill in "Date" with "12.21.2016"
	And I fill in "Time" with "8:00am"
	And I fill in "Repetition" with "Weekly"
	And I press "Confirm"
	Then I should see "Successfully scheduled counseling appointment"
