Feature: index
  Scenario: The game welcome page
    Given I am at the main page
    Then I should see the message 'Welcome'
    And I should see a button with message 'Empezar a jugar'
