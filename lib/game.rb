require './lib/admin.rb'

class Game
  attr_accessor :guess, :word, :trials, :words, :exists, :available_clues, :used_clues, :points, :last_player, :letters , :gamers, :description , :used_words
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
    @secret="colgato"
    @gamers=Hash.new
    @description=''
    @used_words = Array.new

  end

  def start
    @trials=0
    admi= WordAdmin.new
    admi.get_words_from_file
    @guess=Array.new
    @word=Array.new
    @word= admi.get_word
    @description=admi.get_description_of_word(@word.join)
    @word.each{@guess.push('_')}
    @letters=Hash.new
    @available_clues=0
    @used_clues=0
    @used_words=Array.new
  end
  def get_points
    @points+=(70-(@trials*10)-(@used_clues*5))
  end

  def start_with (word,description)
    @points=0
    @trials = 0
    @guess=Array.new
    @word=word.split('')
    @word.each{@guess.push('_')}
    @description=description
    @letters=Hash.new
    @available_clues=0
    @used_clues=0
    @used_words=Array.new
  end

  def verify_word(word)
    if @word.join==word
      @guess=@word
      return true
    else
      @trials+=1
      need_clue?
      return false
    end
  end

  def verify(entrance)
    if entrance.size>1
      verify_word(entrance)
    else
      verify_letter(entrance)
    end
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
        f.puts player_name+'|'+@points.to_s
    end
  end
  def get_last_player
    @last_player
  end
  def get_gamers
    @gamers=Hash.new
    f = File.open("players.txt", "r")
    f.each_line do |line|
      pair= (line.gsub(/\n/,'')).split('|')
      if ! @gamers[pair[1]]
        @gamers[pair[1]]=[]
      end
      @gamers[pair[1]].push(pair[0])
    end
    f.close
  end
  def get_best_scores_from_gamers
    @gamers=@gamers.sort.reverse
    quant_to_show=0
    indice=0
    result = []
    while(quant_to_show<=10 && indice!=@gamers.size)
      @gamers[indice][1].each do |player|
        break if quant_to_show==10
        result.push([player,@gamers[indice][0]])
        quant_to_show+=1
      end
      indice+=1
    end
    @gamers=result
  end
  def identify(word)
    if word==@secret
      true
    else
      false
    end
  end
  def points
    @points
  end

  def get_clue
    if unused_clues != 0
      if 3-used_clues == 1
        @used_clues+=1
        @description
      else
        letter_pos=rand(0..(@word.size-1))
        if @guess[letter_pos] == '_'
          @used_clues+=1
          return @word[letter_pos]
        else
          get_clue
        end
      end
    else
      "Pistas agotadas"
    end
  end
end
