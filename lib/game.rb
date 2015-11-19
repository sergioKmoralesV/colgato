require './lib/admin.rb'

class Game
  attr_accessor :guess, :word, :trials, :words, :exists
  def initialize
    @guess=Array.new
    @word
    @trials=0
    @words=Array.new
    @exists = false
  end

  def start
    @trials=0
    admi= WordAdmin.new
    admi.get_words_from_file
    @word= admi.get_word
    @word.each{@guess.push('_')}
  end

  def start_with (word)
    @trials = 0
    @word=word.split('')
    @word.each{@guess.push('_')}
  end

  def verify_letter(letter)
    if @word.include?(letter)
      (0..(@word.size-1)).each {|x| @guess[x]=letter unless @word[x]!=letter}
      return true
    else
      @trials+=1
      return false
    end
  end
end
