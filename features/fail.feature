Feature: fail
  Scenario: I see failing page
    Given I am at the fail page but I have a score
    Then I should see the phrase '¡Que mala suerte!'
    Then I should see the phrase 'No adivinaste la palabra'
    And I should see an image with id 'perdiste'
    And I should see a question "¿Quieres intentarlo de nuevo?"
    And I should see one button with id 'denuevo'
    And I should see one button with id 'end'


  Scenario: I lose the Game
    Given I am in the play page starting with word "ave"
    When I make 6 mistakes
    Then I should see the phrase 'Que mala suerte!'

  Scenario: I get a clue after the third trial
    Given I am in the play page starting with word "ave"
    When I make 3 mistakes
    And I press the button with id 'clue'
    Then I should see the phrase 'Pista:'
    And I should see the clue

  Scenario: If I use my clue I get no more clues message
    Given I am in the play page starting with word "ave"
    When I make 3 mistakes
    And I press the button with id 'clue'
    And I press the button with id 'clue'
    Then I should see the phrase 'Pistas agotadas'

    Scenario: I get two clues after the forth trial
      Given I am in the play page starting with word "ave"
      When I make 4 mistakes
      And I press the button with id 'clue'
      And I press the button with id 'clue'
      Then I should see the clue

    Scenario: I get three clues after the fifth trial
      Given I am in the play page starting with word "ave"
      When I make 5 mistakes
      And I press the button with id 'clue'
      And I press the button with id 'clue'
      And I press the button with id 'clue'
      Then I should see the clue
