Feature: confirmationlist
	Scenario: I show that Im an admin to see words
		Given I am at the confirmationlist page
    	Then I should see an image with id 'key'
		When I input "colgato" in the textarea "secret"
		And press the button "Identificate"
   		Then I should be at the list page with message "Lista de palabras"

   	Scenario: I dont introduce the right word
		Given I am at the confirmationcreate page
    	Then I should see an image with id 'key'
		When I input "other" in the textarea "secret"
		And press the button "Identificate"
   		Then I should be at the confirmationcreate page with message "Palabra clave"
