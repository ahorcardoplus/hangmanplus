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
    session["hangman"] = Hangman.new session[:phrase]
  else
    session["hangman"] = Hangman.new
  end
  @remainig_attempts = 6
  erb :game
end

post "/guess" do
  letter = params[:letter]
  hangman = session["hangman"]
  @message = hangman.guess(letter)
  @missed_letters = hangman.missed_letters()

  if @message == "miss"
    @remainig_attempts = 5
  else 
    @remainig_attempts = 6
  end
  erb :game
end