Feature: Display Client Profile when selected

	As a counselor
	So that I can quickly look at a certain clients info
	I want to find the right client
	Then I want to see their intake form data and contact info
	
Background: clients have been added to database
  
	Given the following clients exist:
	| name	            | counselor	| email 			        |
	| Hannah Tran		| Toni 		| hannahjtran@gmail.com 	|
	| Joe Adams			| Yolanda 	| joe@adams.com		        |
	
	And the following counselors exist:
	| name		| email					| password	|	phone_number	|	admin	|
	| Toni		| toni@gmail.com		| toni11	|	+15108295840	|	true	|
	
	Given I am on the login page
	And I login with email "toni@gmail.com" and password "toni11"
	And I am on the clients page 
	
Scenario: display information from already filled out google intake form
    Given I am on the clients page
    When I follow "Hannah Tran"
    Then I should see "Intake Information for Hannah Tran"
    And I should see "Gender: Female"
    And I should see "Mailing Address: 533 peters"
    And I should see "Emergency Contact's Phone Number: Client did not answer prompt."
    And I should see "May we send you emails related to our programs and activities here at In the Potters Hands? I agree."
    
Scenario: sad path, client has not filled out google intake form
    Given I am on the clients page
    When I follow "Joe Adams"
    Then I should see "Intake Information for Joe Adams"
    And I should see "Client has not filled out intake form."
	
