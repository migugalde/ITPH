Feature: Create new room

	As an admin
  Since the counselling office locations may change
	I want to be able add a new room to schedule appointments in

Background:
	Given the following counselors exist:
	| name		| email						| password	|	password_confirmation |	phone_number		|	admin	|
	| Toni		|	toni@gmail.com	| toni123		|	toni123								|	+19218594949		|	true	|
  | Bob			|	bob@gmail.com		| bob123		|	bob123								|	+15108295840		|	false	|
  And the following rooms exist
  | name		| color 		|
	| Room 1	|	#FF0000   |


Scenario: I should be able to access the room page from the home page as an admin
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the home page
  Then I should see "Manage Rooms"
  And I follow "Manage Rooms"
  Then I should be on the rooms page

Scenario: I dont want non admins to be able to access to rooms page
  Given I am logged in as "bob@gmail.com" with password "bob123"
  Given I am on the home page
  Then I should not see "Manage rooms"
  Given I am on the rooms page
  Then I should be on the home page
	And I should see "Admin access required"

Scenario: Creating a new room
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the rooms page
	And I press "Create New Room"
  And I fill in "Name" with "New Room"
	And I select "red" from "Color"
  And I press "Create Room"
  Then a room with the name "New Room" should exist
  And I should be on the rooms page

Scenario: Creating a new room (sad path)
  Given I am logged in as "toni@gmail.com" with password "toni123"
  And I am on the rooms page
	And I press "Create New Room"
  And I fill in "Name" with "Room 1"
	And I select "red" from "Color"
  And I press "Create Room"
  Then I should see "Room 1 already exists"
  And I should be on the rooms page
