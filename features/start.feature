Feature: Start
  As a player I want to start the game and see the phrase I need to guess

Scenario: I should see the welcome screen
  Given I open the application
  When I start the game
  Then I should see the text "Welcome to Hangman Plus"

Scenario: I should see the dashes after I started the game
  Given I started a game with phrase "The House"
  Then I should see the text "_ _ _  _ _ _ _ _ "

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "h"
  Then I should see the text "H _ _ _ _  _ _ _ _ _ "

Scenario: When I type a letter that is present in the text I should see it replace the dashes
  Given I started a game with phrase "Hello world"
  When I type "l"
  Then I should see the text "_ _ l l _  _ _ _ l _ "