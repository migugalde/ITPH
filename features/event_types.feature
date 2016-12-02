Feature: Create Different kinds of Events
	As a counselor
	When I want to schedule a non-appointment with several clients and counselors
	I want to create an event that is linked to all of them
	But I dont want it to affect relationships among clients or counselors

Background:
	Given the following counselors exist:
	| name		| email	| password	|	password_confirmation |	phone_number|	admin	|
	| Toni Z	|t@gmail.com	| t123456	|	t123456	|	+15108295840	|	false	|
	And the following clients exist:
	| name	| counselor	| email 			|
	| Bob Smith			| Jack 		| bob@smith.net 	|
	| Fred Astaire		| Toni 		| bob@smith.net 	|
	And the following events exist:
	| title			| date 			| start | end |
	| Zany Dan	| 2115-12-12| 12:00am | 5:00pm |
	And the following rooms exist:
	| name		| color 	|
	| Room 1	|	#FF0000	|
	And the event "Zany Dan" has the following clients: Bob Smith, bob@smith.com
	And the event "Zany Dan" has the following counselors: t@gmail.com
	And the event "Zany Dan" belongs the room "Room 1"
	Given I am logged in as "t@gmail.com" with password "t123456"
	And I am on the home page

Scenario: I make a class successfully
	Given the event "Zany Dan" has type "Class"
	Then there should be an event with type "Class" and name "Zany Dan"

Scenario: I make a community life meeting successfully
	Given the event "Zany Dan" has type "Community Life"
	Then there should be an event with type "Community Life" and name "Zany Dan"

Scenario: I make a Bible Study event successfully
	Given the event "Zany Dan" has type "Bible Study"
	Then there should be an event with type "Bible Study" and name "Zany Dan"


Scenario: I make a counseling appt successfully and it sends an email
	Given the event "Zany Dan" has type "Bible Study"
	Then there should be an event with type "Bible Study" and name "Zany Dan"
	When I send the email for the event "Zany Dan"
	And "bob@smith.com" should receive an email with subject "Appointment reminder and intake form for ITPH"
