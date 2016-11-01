Feature: View appointments for each client

	As a counselor
	So that I can view what appointments I have for a client
	I want to find the client
	Then I want to view the appointments that are listed

Background: clients have been added to database

	Given the following clients exist:
	| name	| counselor	| email 			|
	| Katie Johnson		| Toni 		| katiejohnson@sbcglobal.net 	|
	| John Smith			| Toni 	| johnadams@gmail.com		|
	| Adam Zapel			| Toni 	| adamzapel@yahoo.com 	|
	| Mary Williams			| Toni 		| marywilliams@numen.org	|

	And I am on the clients page

Scenario: View client profile
    Given I am on the clients page
    And I am "Toni"
    When I follow "Katie Johnson"
    Then I should see "Intake Information for Katie Johnson"
    And I should see "Upcoming Appointments:"
    And I should see "There are no scheduled appointments."

Scenario: View appointments
	Given the following appointments are scheduled for "John Smith":
	  | counselor  | date             | room      |
	  | Toni       | 2016-10-27 4:20  | office    |
	  | Toni       | 2016-11-13 11:20 | office    |
	  | Ralph      | 2016-12-23 2:00  | classroom |
	Given I am on the clients page
    And I am "Toni"
    When I follow "John Smith"
    Then I should see "An appointment is scheduled for 2016-10-27 at 4:20 in the office."
    And I should see "An appointment is scheduled for 2016-11-13 11:20 in the office."
    And I should not see "An appointment is scheduled for 2016-12-23 2:00 in the classroom."

Scenario: Cannot view another counselor's appointments
	Given the following appointments are scheduled for "John Smith":
	  | counselor  | date             | room      |
	  | Toni       | 2016-10-27 4:20  | office    |
	  | Toni       | 2016-11-13 11:20 | office    |
	Given I am on the clients page
    And I am "Beyoncé"
    When I follow "John Smith"
    Then I should see "There are no scheduled appointments."