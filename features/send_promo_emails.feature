Feature: Blast/Promotional Emails
	As a counselor
	When I want to send an email to a group of clients
	I want to define and send it through the app

Background:
	Given the following counselors exist:
	| name		| email	| password	|	password_confirmation |	phone_number|	admin	|
	| Toni Z	|t@gmail.com	| t123456	|	t123456	|	+15108295840	|	false	|
	And the following clients exist:
	| name	| counselor	| email 			|
	| Bob Smith			| Toni 		| bob@smith.net 	|
	| Fred Astaire		| Toni 		| bob@smith.net 	|
	Then I am on the home page
	And I click "Schedule Group Event"
	And I check "Bob Smith"
	Then I select "type" as "Other"


Scenario: I make a non-event successfully (send out a promotional email)
	Given I save the event
	Then there should be an event with type "Other" and clients "Bob Smith"
	And "Bob Smith" should recieve an email

Scenario: I set the send time for another date and time
	Given I set "event start" to "12/12/2016" and "event end" to "12/14/2016"
	Then I save the event
	Then there should be an event with type "Other" and clients "Bob Smith"
	And "Bob Smith" should recieve an email with text "12/12/2016"

Scenario: I create a custom email text succesfully
	Given I set "email text" to "This is your own email"
	Then I save the event
	Then there should be an event with type "Other" and clients "Bob Smith"
	And "Bob Smith" should recieve an email with text "This is your own email"

Scenario: I send to multiple clients successfully
	Given I check "Fred Astaire"
	Then I save the event
	Then there should be an event with type "Other" and clients "Bob Smith, Fred Astaire"
	And "Bob Smith" should recieve an email
	And "Fred Astaire" should recieve an email
