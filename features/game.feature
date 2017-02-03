Feature: Game
  As a player I guess with different letters

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "h"
  Then I should see the text "H _ _ _ _    _ _ _ _ _ "

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "z"
  Then I should see the text "_ _ _ _ _    _ _ _ _ _ "

Scenario: When I type a letter that is not present in the text I should see the message miss
  Given I started a game with phrase "The Animal"
  When I type "o"
  Then I should see the text "miss"

Scenario: When I type a letter that is present in the text I should see the message excellent!
  Given I started a game with phrase "The Animal"
  When I type "a"
  Then I should see the text "excellent!"

Scenario: When I start the game I have 6 remaining attempts
  Given I started a game with phrase "Hello world"
  Then I should see the text "6"

Scenario: When I type a letter that is not present in the text I should see 5 remaining attempts
  Given I started a game with phrase "The Animal"
  When I type "o"
  Then I should see the text "5"

Scenario: When I type a letter that is not present in the text I should see Missed letters: o
  Given I started a game with phrase "The Animal"
  When I type "o"
  Then I should see the text "Missed letters: o"

Scenario: When I type 2 letterr that are not present in the text I should see Missed letters: o,z
  Given I started a game with phrase "The Animal"
  When I type "o"
  And I type "z"
  Then I should see the text "Missed letters: o,z"