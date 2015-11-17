Feature: delete
  Scenario: I delete a word
    Given I am in the list page
    When press the button "Borrar" for the word gato
    Then I should not see "gato"
