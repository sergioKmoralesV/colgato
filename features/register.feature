Feature: register
   Scenario: I enter my name
    Given I am at the register page
    When I input "Carla" in the textarea with id "player_name"
    And I press the button "name_button"
    Then I should be at the show_page page with message "Carla"
   	