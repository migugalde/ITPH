Feature: Scheduling an Appointment Error Recover
	As a counselor
	So that I can schedule an appointment with my client
	I want to see any errors to help me know what I did wrong when I make a mistake

Background: counselor has been logged in
	Given I am logged in as Toni
	And the following appointments exist:
	| Counselor | Event Type | Room | Client Name	| Date 		| Time 		| Len 	| Rep 	|
	| Toni		| counseling | A 	| Bob Smith		| 12.12.2016| 11:00am 	| 50	| 0		|
	| Yolanda	| counseling | B 	| White Hat		| 12.12.2016| 11:00pm	| 90	| weekly|
	| Anna		| counseling | B 	| Danny Boy		| 12.12.2016| 11:00am	| 90	| 0		|
	And I am on the home page

Scenario: I want to double book a room
	When I click "Schedule an appointment"
	And I fill in "Room" with "A"
	And I fill in "Client Name" with "Frankie Gee"
	And I fill in "Date" with "12.12.2016"
	And I fill in "Time" with "11:00am"
	And I click "Confirm"
	Then I should see an error "Sorry, Room A is already scheduled for December 12. Please choose another room or another time."

Scenario: I accidentally click submit before fields are filled in
	When I click "Schedule an appointment"
	And I click "Confirm"
	Then I should see an error "Please fill out the clients field to schedule a counseling appointment"