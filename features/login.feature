Feature: Login a counselor

	As a counselor
	So that I can login 
	I want to see the new appointment on my home page

Background: counselors have been added to database

	Given the following counselors exist:
	| name	| username 			| password     |
	| Toni | toni@itph.com     | toni123      |
	| Yolanda | yolanda@itph.com	| nottoni123   |

	And I am on the login page

Scenario: Successfully login a counselor
	When I type "toni@itph.com" in the "username" field
	And I type "toni123" in the "password" field
	And I click "Login"
	Then I should be redirected to the "home_page" page
	And I should see "Toni's Calendar"

Scenario: Failed to login a counselor
    When I type "yolanda@itph.com" in the "username" field
    And I type "yolanda123" in the "password" field
    And I click "login"
    Then I should stay on the "login" page
    And I should see the message "Username/ password incorrect"
