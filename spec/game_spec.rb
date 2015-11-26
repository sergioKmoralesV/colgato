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
   expect(@juego.trials).to eq 1
 end

 it 'gets a clue for the word if I have clues available' do
  @juego.start_with("ave")
  (0..2).each{@juego.verify_letter('x')}
  expect(@juego.word.include?(@juego.get_clue)).to eq true
 end

it 'gets "Pistas agotadas" if I have no clues available' do
  @juego.start_with("ave")
  expect(@juego.get_clue=="Pistas agotadas").to eq true
end
 it 'after the third mistake you get one clue' do
   @juego.start_with("ave")
   (0..2).each{@juego.verify_letter('x')}
   expect(@juego.available_clues).to eq 1
 end

 it 'after the forth mistake you get two clues' do
   @juego.start_with("ave")
   (0..3).each{@juego.verify_letter('x')}
   expect(@juego.available_clues).to eq 2
 end

 it 'after the forth mistake you get three clues' do
   @juego.start_with("ave")
   (0..4).each{@juego.verify_letter('x')}
   expect(@juego.available_clues).to eq 3
 end

 it 'when I use my clue I get 1 used clues' do
   @juego.start_with("ave")
   (0..2).each{@juego.verify_letter('x')}
   @juego.get_clue
   expect(@juego.unused_clues).to eq 0
 end

end
