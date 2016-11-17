Feature: Send Emails with Event Creation
	As a counselor
	When I want to create an event
	Then I want to send my client an appointment email successfully

Background:
	Given the following counselors exist:
	| name		| email	| password	|	password_confirmation |	phone_number|	admin	|
	| Bob		|bob@gmail.com	| bob123	|	bob123	|	+15108295840	|	false	|
	| Toni Z	|t@gmail.com	| t123456	|	t123456	|	+15108295840	|	false	|
	And the following events exist:
	| title			| date 		| room 	|
	| Zany Dan	| 2115-12-12 | blue	|
	And the event "Zany Dan" has the following clients: Fred, fred@gmail.com
	And the event "Zany Dan" has the following counselors: bob@gmail.com
	Given I am logged in as "bob@gmail.com" with password "bob123"
	And I am on the home page
	And no emails have been sent

Scenario: I make a simple event and they recieve an email
	When I send the email for the event "Zany Dan"
	Then "dan@gmail.com" should receive an email with subject "Appointment reminder and intake form for ITPH"

Scenario: I make an event with multiple clients and they all recieve an email
	Given the event "Zany Dan" has the following clients: Fred, fred@gmail.com, Amy, amy@gmail.com
	When I send the email for the event "Zany Dan"
	Then "dan@gmail.com" should receive an email with subject "Appointment reminder and intake form for ITPH"
	Then "amy@gmail.com" should receive an email with subject "Appointment reminder and intake form for ITPH"

Scenario: I make an event with multiple counselors
	And the event "Zany Dan" has the following counselors: bob@gmail.com, t@gmail.com
	When I send the email for the event "Zany Dan"
	Then "dan@gmail.com" should receive an email with text "Toni Z"

Scenario: I delete an event
	And the event "Zany Dan" has the following counselors: bob@gmail.com, t@gmail.com
	When I send the email for the event "Zany Dan"
	Then "dan@gmail.com" should receive an email with subject "Appointment reminder and intake form for ITPH"
	When I send the cancellation email for the event "Zany Dan"
	Then "dan@gmail.com" should receive an email with subject "Appointment cancellation notification for ITPH"