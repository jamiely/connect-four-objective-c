Feature:
  As a game player
  I want to make moves
  So that I can play the game

  Scenario:
    I start a game

    Given I launch the app and start the game
    When I touch column 1
    Then column 1 should start with "a"
    When I touch column 1
    Then column 1 should start with "a,b"
    When I touch column 2
    Then column 2 should start with "a"
    Then I touch column 1
    Then column 1 should start with "a,b,b"
    Then I touch column 2
    Then I touch column 1
    Then I touch column 2
    Then I should not see an alert view
    Then I touch column 1
    Then I should see an alert view titled "The game has been won by O!"
    Then I touch "OK"
    Then I should not see an alert view

