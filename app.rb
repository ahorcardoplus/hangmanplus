require 'sinatra'
require './config'
require './lib/hangman'

get '/' do
  if params["phrase"]
    session[:phrase] = params["phrase"]
  end

  erb :index
end

post "/start" do
  if session[:phrase]
    hangman = Hangman.new session[:phrase]
  else
    hangman = Hangman.new
  end
  @remainig_attempts = hangman.remaining_fail_attempts()

  session["hangman"] = hangman
  erb :game
end

post "/guess" do
  letter = params[:letter]
  hangman = session["hangman"]
  @message = hangman.guess(letter)

  if hangman.game_status == :won or hangman.game_status == :lost
    return erb :result
  end

  @missed_letters = hangman.missed_letters()
  @remainig_attempts = hangman.remaining_fail_attempts()

  erb :game
end
