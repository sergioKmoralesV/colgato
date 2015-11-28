Feature: confirmationcreate
	Scenario: I show that Im an admin to create a word
		Given I am at the confirmationcreate page
		When I input "colgato" in the textarea "secret"
		And press the button "Identificate"
   		Then I should be at the createword page with message "Crear palabra"
		