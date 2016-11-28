Feature: Edit existing rooms
	As an counselor
  Since the event calendar will have many events
	I want to be able to filter the events based on room
  And I want to be able to filter events based on whether I am involved

Background:
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
  | Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|
  And the following rooms exist
  | name		| color |
	| Room 1	|	red   |
  And the following events exist:
	| title			  | date 		   | room 	| start   | end    |
	| Meeting  	  | 2115-12-12 | blue	  | 12:00am | 2:00pm |
  | Group Event	| 2115-12-12 | red    | 2:00pm  | 5:00pm |
  And the event "Meeting" has the following counselors: toni@gmail.com
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the home page

Scenario: Filter based on room
  pending
  Given I check "Room 1"
  Then I should see "Group Event"
  And I should not see "Meeting"

Scenario: Filter based on room
  pending
  Given I check "Only my events"
  Then I should see "Meeting"
  And I should not see "Group Event"
