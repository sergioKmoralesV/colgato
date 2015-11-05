Feature: play 
	Scenario: 
		Given I am in the play page
		When I input "g" in the textarea "letter"
		And press the button "try"
		Then I should see "g"
		And I should see "Guess the word"
		
