require 'sinatra'

$guess= Array.new
$word = "gatuno".split('')
$trials=0
$image=''
$new_word="hh"
# crea un nuevo archivo y escribe

	



get '/' do
	
	$guess = Array.new
	$word.each {$guess.push('_')}
	$trials=0
  erb :index
end


get '/play' do
	$image="<img id='logo' src='"+"/images/intento "+$trials.to_s+".png'>"
	erb :play
end

post '/play' do
	$letter = params[:letter]
	if $word.include?($letter)
		(0..($word.size-1)).each {|x| $guess[x]=$letter unless $word[x]!=$letter}
	else
		$trials+=1
		$image="<img id='logo' src='"+"/images/intento "+$trials.to_s+".png'>"
	end
	erb :play
end

get '/win' do
	erb :win
end

get '/fail' do
	erb :fail
end

get '/createword' do

	erb :createword
end

post '/createword' do
$new_word = params[:new_letter]
	
	File.open('text.txt', 'a') do |f|
  f.puts $new_word
end
	erb :createword
end
