Feature: createword
	Scenario: createword
		Given I am in the createword page
		When I input "gato" in the area "new_letter"
		And press the button with id "create"
		Then I should see the word "gato" in the label with id "word"
		


