require 'sinatra'
require './lib/game'

$juego = Game.new
$image=''
$letter=''

get '/' do
	$juego =Game.new
	$juego.start
	$letter=''
  erb :index
end


get '/play' do
	$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png' >"
	erb :play
end

post '/play' do
	$letter = params[:letter]
	if $juego.word.include?($letter)
		(0..($juego.word.size-1)).each {|x| $juego.guess[x]=$letter unless $juego.word[x]!=$letter}
	else
		$juego.trials+=1
		$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png'>"
	end
	redirect '/fail' unless $juego.trials!=6
	redirect '/win' unless $juego.guess.include?('_')
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
$juego.new_word($new_word)
	erb :createword
end
get '/list' do
	$list_words=$juego.get_words_from_file
	erb :list
end
