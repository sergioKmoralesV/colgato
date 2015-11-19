require 'game'
describe Game do

 before :each do
  @juego = Game.new
 end

 it 'game starts with different values of global variables' do
   @juego.start
   expect(@juego.trials).to eq 0
   expect(@juego.guess.include?(/\W/)).to eq false
 end

 it 'game starts with an specific word' do
   @juego.start_with("ave")
   expect(@juego.trials).to eq 0
   expect(@juego.word.join).to eq "ave"
   expect(@juego.guess.include?(/\W/)).to eq false
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
