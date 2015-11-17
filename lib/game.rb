class Game
  attr_accessor :guess, :word, :trials, :words, :exists
  def initialize
    @guess=Array.new
    @word
    @trials=0
    @words=Array.new
    @exists= false
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
    @exists= false
    File.open('text.txt', 'a') do |f|
      if ! @words.include?(word)
        f.puts word
      else
         @exists= true
      end
  	end
    f.close
  end
  def delete(word)
    @words.delete(word)
    f=File.open('text.txt', 'w')
    @words.each { |word| f.puts word}
    f.close

  end
end
