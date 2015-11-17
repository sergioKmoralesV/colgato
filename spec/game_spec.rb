require 'game'
describe Game do

 before :each do
  @juego = Game.new
 end

 it 'game starts with different values of global variables' do
   @juego.start
   expect(@juego.trials).to eq 0
   expect(@juego.words.size).not_to eq 0
   expect(@juego.guess.include?(/\W/)).to eq false
 end

 it 'gets all the words from doc' do
   @juego.get_words_from_file
   expect(@juego.words.size).not_to eq 0
 end

 #it 'adds new word' do
   #@juego.get_words_from_file
   #@juego.new_word('pepito')
   #expect(@juego.exists).to eq false
 #end

 it 'adds existing word' do
   @juego.get_words_from_file
   @juego.new_word('gato')
   expect(@juego.exists).to eq true
 end
end
