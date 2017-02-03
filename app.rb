require 'sinatra'
require './config'

get '/' do
  erb :index
end

post "/start" do
  erb :game
end