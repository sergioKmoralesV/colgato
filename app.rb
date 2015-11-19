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
	$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png'>" unless $juego.verify_letter($letter)==true
	redirect :fail unless $juego.trials!=6
	redirect :win unless $juego.guess.include?('_')
	erb :play if $juego.trials<6
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
	if $juego.exists
		$new_word="Ya existe"
	else
		$new_word = params[:new_letter]
	end
	erb :createword
end

get '/list' do
	$juego.get_words_from_file
	$list_words=$juego.words
	erb :list
end

post '/delete' do
	$deleted = params[:val]
	$juego.delete($deleted)
	redirect :list
end
