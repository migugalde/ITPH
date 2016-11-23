Feature: Edit existing rooms
	As an admin
  Since the counselling office locations may change
	I want to edit room information and delete rooms

Background:
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
  | Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|
  And the following rooms exist
  | name		| color |
	| Room 1	|	red   |
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the rooms page

Scenario: Editing the rooms color
  pending
  Given I press edit
  And I select room color as "blue"
  And I press "Save"
  Then the room "Room 1" should have the color "blue"

Scenario: Editing the rooms name
  pending
  Given I press edit
  And fill in "Room Name" with "Room 2"
  And I press "Save"
  Then a room with the name "New Room" should exist
  And a room with the name "Room 2" should not exist

Scenario: Deleting existing room
  pending
  Given I press "Delete"
  I should see a new popup
  And I press "Yes"
  Then a room with name "Room 1" should not exist
