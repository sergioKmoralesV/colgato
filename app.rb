require 'sinatra'

$guess= Array.new
$word = "gatuno".split('')

get '/' do
	$guess = Array.new
	$word.each {$guess.push('_')}
  erb :index
end


get '/play' do
	erb :play
end

post '/play' do
	$letter = params[:letter]
	if $word.include?($letter)
		(0..($word.size-1)).each {|x| $guess[x]=$letter unless $word[x]!=$letter}
	end
	erb :play
end
