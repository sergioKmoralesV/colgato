class Game
  attr_accessor :guess, :word, :trials, :words
  def initialize
    @guess=Array.new
    @word
    @trials=0
    @words=Array.new
  end
  def start
    @trials=0
    get_words_from_file
    @word=@words[rand(0..(@words.size-1))].split('')
    @word.each{@guess.push('_')}
  end
  def get_words_from_file
    @words=Array.new
    f = File.open("text.txt", "r")
  	f.each_line do |line|
  	  @words.push(line.gsub(/\n/,''))
  	end
  	f.close
  end
  def new_word(word)
    File.open('text.txt', 'a') do |f|
    		f.puts word
  	end
  end
end
