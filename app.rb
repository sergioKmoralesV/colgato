require 'sinatra'


get '/' do
  erb :index
end


get '/play' do
	
	
	erb :play  
end
post '/play' do
	@word="gatuno"
	@letter = params[:letter]
	erb :play
  
end


