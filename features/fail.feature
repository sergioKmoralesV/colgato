Feature: fail
  Scenario: I see failing page
    Given I am at the fail page
    Then I should see the phrase 'Que mala suerte!'
    And I should see an image with id 'perdiste'
    And I should see a question "¿Quieres intentarlo de nuevo?"
    And I should see one button with id 'denuevo'
