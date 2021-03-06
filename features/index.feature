Feature: index
  Scenario: The game welcome page
    Given I am at the main page
    Then I should see the message 'Bienvenido'
    And I should see a button with id 'play'
    And I should see a button2 with id 'create_word'
    And I should see a button3 with id 'list_words'
    And I should see a button with id 'best'
    And I should see an image with id 'logo'

  Scenario: I start the game
    Given I am at the main page
    When I press the button with id 'play'
    Then I should be at the game page with message 'Adivina la palabra'

 Scenario: I create a word
    Given I am at the main page
    When I press the button with id 'create_word'
    Then I should be at the confirmationcreate page with message 'Palabra clave'

Scenario: I list the words
    Given I am at the main page
    When I press the button with id 'list_words'
    Then I should be at the confirmationlist page with message 'Palabra clave'

Scenario: I list the best
    Given I am at the main page
    When I press the button with id 'best'
    Then I should be at the best page with message 'Mejores puntajes'
    
