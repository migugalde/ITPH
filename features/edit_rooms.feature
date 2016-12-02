Feature: Edit existing rooms
	As an admin
  Since the counselling office locations may change
	I want to edit room information and delete rooms

Background:
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
  | Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|
  And the following rooms exist:
  | name		| color 	|
	| Room 1	|	#FF0000	|
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the rooms page

Scenario: Editing the rooms color
  Given I press "edit_room_1"
  And I select "green" from "Color"
  And I press "Update Room"
  Then the room "Room 1" should have the color "#7bd148"

Scenario: Editing the rooms name
	Given I press "edit_room_1"
  And fill in "Name" with "New Room"
  And I press "Update Room"
  Then a room with the name "New Room" should exist
  And a room with the name "Room 1" should not exist

Scenario: Deleting existing room
  Given I press "delete_room_1"
	Then a room with the name "Room 1" should not exist
