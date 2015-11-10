require 'sinatra'
$guess = Array.new
$word="g a t u n o"
$real_word=$word.split(" ");


get '/' do
	$guess = Array.new
	@word_size=$real_word.count
for i in 0..@word_size-1
   $guess.push("_")
end
  
  erb :index

end


get '/play' do
	
	erb :play


end

post '/play' do
	
	@letter= params[:letter]
	if $real_word.include?(@letter)
		$guess[$real_word.index(@letter)]=@letter
		
	end
	erb :play
end
