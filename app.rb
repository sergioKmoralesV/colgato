require 'sinatra'

$guess= Array.new
$word = "gatuno".split('')
$trials=0
$image=''
<<<<<<< HEAD
$letter=''
=======
$new_word=""
$list_words=Array.new


>>>>>>> 56e92f57075ea6fab2e8ae0a51501712e9523031

get '/' do
	
	$guess = Array.new
	$word.each {$guess.push('_')}
	$trials=0
	$letter=''
  erb :index
end


get '/play' do
	$image="<img id='logo' src='/images/intento"+$trials.to_s+".png' >"
	erb :play
end

post '/play' do
	$letter = params[:letter]
	if $word.include?($letter)
		(0..($word.size-1)).each {|x| $guess[x]=$letter unless $word[x]!=$letter}
	else
		$trials+=1
		$image="<img id='logo' src='/images/intento"+$trials.to_s+".png'>"
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
get '/list' do
	$list_words=Array.new
	f = File.open("text.txt", "r")
	f.each_line do |line|
	  $list_words.push(line)
	end
	f.close
 erb :list
end
