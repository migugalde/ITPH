Feature: Display Client Profile when selected

	As a counselor
	So that I can quickly look at a certain clients info
	I want to find the right client
	Then I want to see their intake form data and contact info
	
Background: clients have been added to database
	
	Given the following clients exist:
	| name	            | counselor	| email 			        |
	| Hannah Tran		| Toni	 	| hannahjtran@gmail.com 	|
	| Joe Adams			| Toni 		| joe@adams.com		        |
	| Matt Smith		| Yolanda	| matt@matt.com				|
	
	And the following counselors exist:
	| name		| email					| password	|	phone_number	|	admin	|
	| Toni		| toni@gmail.com		| toni11	|	+15108295840	|	true	|
	| Yolanda   | yolanda@gmail.com     | yolanda12 |                   |   false   |
	
	Given I am on the login page
	And I login with email "toni@gmail.com" and password "toni11"
	And I am on the clients page  
	
Scenario: display information from already filled out google intake form
    Given I am on the clients page
    And the client "Hannah Tran" has the following counselors: toni@gmail.com
    When I follow "Hannah Tran"
    Then I should see "Intake Information for Hannah Tran"
    And I should see "Gender: Female"
    And I should see "Address: 533 peters"
    And I should see "Can we send general emails? I agree."
    And I should not see "Employer"
    And I should see "Date of Birth: 9/9/1999"
    And I should see "Age: 21"
    And I should not see "List of problems"
    And I should not see "Has anyone in client's family had a mental, emotional, or substance abuse problem?"
    And I should see "Emergency Contact: Bob"

Scenario: sad path, client has not filled out google intake form
    Given I am on the clients page
    And the client "Joe Adams" has the following counselors: toni@gmail.com
    When I follow "Joe Adams"
    Then I should see "Intake Information for Joe Adams"
    And I should see "Client has not filled out intake form."
    
Scenario: cannot view intake form of another counselor's client
    Given I am on the clients page
    And the client "Matt Smith" has the following counselors: yolanda@gmail.com
    When I follow "Matt Smith"
    Then I should see "Intake Information for Matt Smith"
    And I should not see "intake form"
	
