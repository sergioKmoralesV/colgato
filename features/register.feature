Feature: register
  Scenario: I end the game and save my score
    Given I am at the register page
    When I input "Carla" in the textarea with id "player_name"
  	And press the button "name"
  	Then I should see the message 'Carla'
