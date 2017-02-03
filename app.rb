require 'sinatra'
require './config'
require './lib/hangman'

get '/' do
  erb :index
end

post "/start" do
  @hangman = Hangman.random_game
  @dashes = @hangman.show_dashes
  erb :game
end

post "/guess" do
  letter = param[:letter]
  "H _ _ _ _  _ _ _ _ _"
end

post "/reset" do
  @hangman = Hangman.random_game
  @dashes = @hangman.show_dashes
  erb :game
end