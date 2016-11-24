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
	Then I am on the home page
	And I click "Schedule Group Event"
	And I check "Bob Smith"

Scenario: I make a class successfully
	Given I select "type" as "Class"
	And I save the event
	Then there should be an event with type "Class" and client "Bob Smith"

Scenario: I make a community life meeting successfully
	Given I select "type" as "Community Life Meeting"
	And I save the event
	Then there should be an event with type "Community Life Meeting" and client "Bob Smith"

Scenario: I make a team event successfully
	Given I select "type" as "Team Event"
	And I save the event
	Then there should be an event with type "Team Event" and client "Bob Smith"

Scenario: I make a Bible Study event successfully
	Given I select "type" as "Community Life Meeting"
	And I save the event
	Then there should be an event with type "Community Life Meeting" and client "Bob Smith"

Scenario: I make a generic event successfully
	Given I select "type" as "Other"
	And I save the event
	Then there should be an event with type "Other" and client "Bob Smith"

Scenario: I define a different meeting location successfully
	Given I select "type" as "Other"
	And I select "location" as "1111 East Bay St, Pleasanton, CA"
	And I save the event
	Then there should be an event with type "Other" and client "Bob Smith" and location "1111 East Bay St, Pleasanton, CA"

Scenario: I do not become the clients counselor after creating the event
	Given there should be an event with type "Other" and client "Bob Smith" and location "1111 East Bay St, Pleasanton, CA"
	And I click "Client"
	Then I should see the counselor for "Bob Smith" is "Jack"

Scenario: I am currently the clients counselor and nothing changes
	Given there should be an event with type "Other" and client "Fred Astaire" and location "1111 East Bay St, Pleasanton, CA"
	And I click "Client"
	Then I should see the counselor for "Bob Smith" is "Jack"
	Then I should see the counselor for "Fred Astaire" is "Toni"