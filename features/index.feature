Feature: index
  Scenario: The game welcome page
    Given I am at the main page
    Then I should see the message 'Bienvenido'
    And I should see a button with id 'play'
    And I should see an image with id 'logo'

  Scenario: I start the game
    Given I am at the main page
    When I press the button with id 'play'
    Then I should be at the game page with message 'Adivina la palabra'

 Scenario: I create a word
    Given I am at the main page
    When I press the button with id 'create_word'
    Then I should be at the createword page with message 'Crear palabra'