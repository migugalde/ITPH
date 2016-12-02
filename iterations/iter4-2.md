Feature: Create Different kinds of Events
	As a counselor
	When I want to schedule a non-appointment with several clients and counselors
	I want to create an event that is linked to all of them
	But I dont want it to affect relationships among clients or counselors

Feature: Create form to add (multiple) new clients within event creation
	When a user (counselor) creates a new event
	If they are adding a new client
	Then they will be able to input their information dynamically right in the form
	And it will save to the database and event successfully

Feature: Create new room
	As an admin
	Since the counselling office locations may change
	I want to be able add a new room to schedule appointments in

Feature: Edit existing rooms
	As an counselor
	Since the event calendar will have many events
	I want to be able to filter the events based on room
	And I want to be able to filter events based on whether I am involved

Feature: Display Client Profile when selected
	As a counselor
	So that I can quickly look at a certain clients info
	I want to find the right client
	Then I want to see their intake form data and contact info
	And can only view my clients intake form

Chores:
Sending emails through devise
Cannot click on events they dont own
Recurring events
Integrated intake form with database
