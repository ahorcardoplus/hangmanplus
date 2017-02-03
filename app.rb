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
  erb :game
end

post "/guess" do
  letter = params[:letter]
  hangman = session["hangman"]
  hangman.guess(letter)
  erb :game
end

post "/reset" do
  if params["env"] == "test"
    session["hangman"] = Hangman.new "the animal"
  end
  erb :game
end