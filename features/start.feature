Feature: Start
  As a player I want to start the game and see the phrase I need to guess

Scenario: I should see the welcome screen
  Given I open the application
  When I start the game
  Then I should see the text "Welcome to Hangman Plus"

Scenario: I should see the dashes after I started the game
  Given I started a game
  Then I should see the text "_ _ _  _ _ _ _ _"