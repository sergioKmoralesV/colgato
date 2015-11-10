require 'sinatra'
@guess = Array.new
@real_word = Array.new

get '/' do
  @guess = Array.new
  @real_word = Array.new
  erb :index

end


get '/play' do

	erb :play

end

post '/play' do

	
	@word="g a t u n o"
	@real_word=@word.split(" ")
	@size=@real_word.size-1



	@letter = params[:letter]

	for counter in 0..@size
	 @guess.push("_")
	 
	end

	erb :play
end
