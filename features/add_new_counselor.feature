Feature: Add new counselor

	As the admin
	I want to be able to create new counselor accounts

  Background:

  	Given the following counselors exist:
  	| Last Name | First Name	| Email	              | Username |
  	| Doe	      | John		    | johndoe@gmail.com 	| jdoe     |

  Scenario: New counselor page shown
    Given I am on the home page
    And I press "Add new counselor"
    Then I should be on the new counselor page

  Scenario: Add new counselor
    Given I am on the new counselor page
    And I fill in "First Name" with "Donald"
    And I fill in "Last Name" with "Trump"
    And I fill in "Email" with "thedonald@gmail.com"
    And I fill in "Username" with "dtrump"
    And I press "Done"
    Then I should be on the home page
    And I should see "Counselor successfully added."

  Scenario: Add an existing counselor
    Given I am on the new counselor page
    And I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "johndoe@gmail.com"
    And I fill in "Username" with "jdoe"
    And I press "Done"
    Then I should be on the home page
    And I should see "Counselor already exists."
