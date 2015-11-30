Feature: best
    Scenario: I see the list of best scores
        Given I am in the best page
        Then I should see a table with id "players"
        And I should not see the number '11)'
