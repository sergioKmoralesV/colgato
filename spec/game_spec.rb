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

 it 'game starts with an specific word' do
   @juego.start_with("ave")
   expect(@juego.trials).to eq 0
   expect(@juego.word.join).to eq "ave"
   expect(@juego.guess.include?(/\W/)).to eq false
 end

 it 'gets all the words from doc' do
   @juego.get_words_from_file
   expect(@juego.words.size).not_to eq 0
 end

 it 'adds new word' do
   @juego.get_words_from_file
   @juego.new_word('pepito')
   expect(@juego.exists).to eq false
   @juego.delete('pepito')
 end

 it 'adds existing word' do
   @juego.get_words_from_file
   @juego.new_word(@juego.words.first)
   expect(@juego.exists).to eq true
 end

 it 'deletes a word' do
   @juego.get_words_from_file
   @word=@juego.words.first
   @juego.delete(@juego.words.first)
   expect(@juego.words.include?(@word)).to eq false
   @juego.new_word(@word)
 end

 it 'verifies a correct letter' do
   @juego.start
   expect(@juego.verify_letter(@juego.word.first)).to eq true
 end

 it 'verifies an incorrect letter' do
   @juego.start_with("ave")
   expect(@juego.verify_letter("x")).to eq false
 end
end
