Feature: win
  Scenario:
    Given I am at the win page
    Then I should see a message 'Felicidades!'
    And I should see an image with id 'ganaste'
    And I should see the text "¿Quieres probar otra palabra?"
    And I should see button with id 'again'
