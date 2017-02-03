require 'sinatra'
require './config'

get '/' do
  erb :index
end

post "/start" do
  @dashes = "_ _ _  _ _ _ _ _"
  erb :game
end

post "/reset" do
  @dashes = "_ _ _  _ _ _ _ _ _"
  erb :game
end