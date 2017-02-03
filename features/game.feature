Feature: Game
  As a player I guess with different letters

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "h"
  Then I should see the text "H _ _ _ _  _ _ _ _ _ "

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "l"
  Then I should see the text "_ _ l l _  _ _ _ l _ "

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "The Animal"
  When I type "o"
  Then I should see the text "miss"

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "The Animal"
  When I type "a"
  Then I should see the text "excellent!"