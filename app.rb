require 'sinatra'
require './lib/game'

$juego = Game.new
$image=''
$letter=''
$name=''

get '/' do
	$juego =Game.new
	$juego.start
	$letter=''
	$clue=nil
	$name = ''
  erb :index
end


get '/play' do
	$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png' >"
	erb :play
end

post '/play' do
	$letter = params[:letter]
	$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png'>" unless $juego.verify_letter($letter)
	$clue = nil
	if $juego.trials<6
		if $juego.guess.include?('_')
			erb :play
		else
			$juego.get_points()
			erb :win
		end
	else
		erb :fail
	end
end

get '/win' do
	erb :win
end
get '/best' do
	erb :best
end
get '/confirmationcreate' do
	erb :confirmationcreate
end
post '/confirmationcreate' do
	if $juego.identify(params[:secret])
	erb :createword

	else
	erb :confirmationcreate
		
	end
end

get '/confirmationlist' do
	erb :confirmationlist
end
post '/confirmationlist' do
	if $juego.identify(params[:secret])
		$admin =  WordAdmin.new
	$admin.get_words_from_file
	$list_words=$admin.words
	erb :list

	else
	erb :confirmationlist
		
	end
end

post '/register' do
	$juego.enter_name(params[:player_name])
	erb :show_page
end

get '/playagain' do
	$juego.start
	$letter=''
	$clue=nil
	$name = ''
	$image="<img id='logo' src='/images/intento"+$juego.trials.to_s+".png'>"
	erb :play
end

get '/show_page' do
	erb :show_page
end
get '/fail' do
	erb :fail
end

get '/createword' do
	erb :createword
end

post '/createword' do
	$new_word = params[:new_letter]
	$admin =  WordAdmin.new
	$new_word=$admin.new_word($new_word)
	erb :createword
end

get '/list' do
	$admin =  WordAdmin.new
	$admin.get_words_from_file
	$list_words=$admin.words
	erb :list
end

get '/clue' do
	$clue = $juego.get_clue
	erb :play
end

post '/delete' do
	$deleted = params[:val]
	$admin =  WordAdmin.new
	$admin.get_words_from_file
	$admin.delete($deleted)
	redirect :list
end

get '/register' do
	erb :register
end
