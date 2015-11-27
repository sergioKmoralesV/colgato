require './lib/admin.rb'

class Game
  attr_accessor :guess, :word, :trials, :words, :exists, :available_clues, :used_clues, :points, :last_player, :letters
  def initialize
    @last_player=""
    @guess=Array.new
    @word
    @trials=0
    @exists = false
    @available_clues=0
    @used_clues=0
    @letters=Hash.new
    @points=0
  end

  def start
    @trials=0
    admi= WordAdmin.new
    admi.get_words_from_file
    @guess=Array.new
    @word=Array.new
    @word= admi.get_word
    @word.each{@guess.push('_')}
    @letters=Hash.new
    @available_clues=0
    @used_clues=0
  end
  def get_points
    @points+=10
  end

  def start_with (word)
    @points=0
    @trials = 0
    @guess=Array.new
    @word=word.split('')
    @word.each{@guess.push('_')}
    @letters=Hash.new
    @available_clues=0
    @used_clues=0
  end

  def verify_letter(letter)
      if @word.include?(letter)
        (0..(@word.size-1)).each {|x| @guess[x]=letter unless @word[x]!=letter}
        @letters[letter]=true
        return true
      else
        @trials+=1
        need_clue?
        @letters[letter]=false
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
  def enter_name(player_name)
    @last_player=player_name
    File.open('players.txt', 'a') do |f|
        f.puts player_name+','+@points.to_s
    end
  end
  def get_last_player
    @last_player
  end
  def points
    @points
  end

  def get_clue
    if unused_clues != 0
      letter_pos=rand(0..(@word.size-1))
      if @guess[letter_pos] == '_'
        @used_clues+=1
        return @word[letter_pos]
      else
        get_clue
      end
    else
      "Pistas agotadas"
    end
  end
end
