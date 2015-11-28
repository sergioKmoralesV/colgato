Feature: play
	Scenario: I enter a letter
		Given I am in the play page
		When I input "g" in the textarea "letter"
		And press the button "Inténtalo!"
		Then I should see "g"
		And I should see "Adivina la palabra!"

	Scenario: I enter a correct letter
		Given I am in the play page
		When I guess a correct letter
		Then I should see the letter
		And I should see the letter in the word

	Scenario: I enter a incorrect letter
		Given I am in the play page starting with word "ave"
		When I input "x" in the textarea "letter"
		And press the button "Inténtalo!"
		Then I should see "x"
		And I should see a part of the cat

	Scenario: It shows a record of the letters I put
		Given I am in the play page starting with word "ave"
		When I input "x" in the textarea "letter"
		And press the button "Inténtalo!"
		And I input "n" in the textarea "letter"
		And press the button "Inténtalo!"
		Then I should see "x"
		And I should see "n"
