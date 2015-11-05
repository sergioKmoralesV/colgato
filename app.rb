require 'sinatra'
@@real_word = Array.new

get '/' do
  erb :index
end


get '/play' do

	erb :play

end

post '/play' do

	@word="gatuno"

@word.split(//).each {|c|
      @@real_word.push(c)


}


	@letter = params[:letter]
	@size=@@real_word.size

	for counter in 0..@size
	 if @letter==@@real_word[counter]
    		puts 1
    	end
	end

	erb :play
end
