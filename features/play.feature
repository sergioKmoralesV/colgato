Feature: play
	Scenario:
		Given I am in the play page
		When I input "g" in the textarea "letter"
		And press the button "Inténtalo!"
		Then I should see "g"
		And I should see "Adivina la palabra!"
