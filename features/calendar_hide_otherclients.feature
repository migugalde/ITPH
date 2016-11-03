Feature: Hide Client Names from other counselors: calendar
	As a counselor
	So that no one else can who I am scheduled with
	I want only myself to see my clients

Background: Several Appointments Exist
	Given I am on the home page
	Then I should see the calendar

	Then I am on the home page

Scenario: I want to view who I am scheduled with
	Given I am looking at the month of "2016-12"
	Then I should see "Fancy Feast" has an appointment with Anna on 2016-12-12
	And I should see "Bobby Feast" has an appointment with Anna on 2016-13-12

Scenario: I want to view someone elses appointment (SAD)
	Given I am looking at the day of "2016-12-12"
	And I press "Fancy Feast"
	Then I should see an error

Scenario: I want to not see anyone elses client names in the month
	Given I am looking at the month of "2016-12"
	Then I should see Toni is scheduled in Room1 on 2016-12-12
	And I should see Yolanda is scheduled in Room2 on 2016-12-12
	And I should see "Fancy Feast" has an appointment with Anna on 2016-12-12
	And I should see "Bobby Feast" has an appointment with Anna on 2016-13-12
	And I should not see "Davy C"
	And I should not see "Bob Smith"