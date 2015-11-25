require './lib/admin.rb'

class Game
  attr_accessor :guess, :word, :trials, :words, :exists, :available_clues, :used_clues
  def initialize
    @guess=Array.new
    @word
    @trials=0
    @exists = false
    @available_clues=0
    @used_clues=0
    @letters=Hash.new
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
      need_clue?
      return false
    end
  end
  def unused_clues
    @available_clues - @used_clues
  end
  def need_clue?
    @available_clues=@trials-2
    @available_clues=0 if @available_clues<0
  end

  def get_clue
    letter_pos=rand(0..(@word.size-1))
    if @guess[letter_pos] == '_'
      @used_clues+=1
      return @word[letter_pos]
    else
      get_clue
    end
  end
end
