require 'sinatra'

get '/play' do
	@word="gatuno"
	erb :play
  
end