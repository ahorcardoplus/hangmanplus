Feature: Start
  As a player I want to start the game and see the phrase I need to guess

Scenario: I should see the welcome screen
  Given I open the application
  When I start the game
  Then I should see the text "Welcome to Hangman Plus"
