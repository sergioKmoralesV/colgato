class WordAdmin
  attr_accessor :words, :exists, :secret
  def initialize
    @words=Hash.new
    get_words_from_file
    @secret="colgato"
  end

  def get_word
    get_words_from_file
    (@words.keys[rand(0..(@words.keys.size-1))]).split('')
  end

  def get_description_of_word(word)
    @words[word]
  end
  def get_words_from_file
    @words=Hash.new
    f = File.open("dictionary.txt", "r")
  	f.each_line do |line|
      pair=(line.gsub(/\n/,'')).split('|')
  	  @words[pair[0]]=pair[1]
  	end
  	f.close
  end

  def new_word(word,description)
    @resp=''
    File.open('dictionary.txt', 'a') do |f|
      if !@words[word]
        f.puts word+'|'+description
        @resp = word
      else
         @resp= "Ya existe"
      end
  	end
    get_words_from_file
    @resp
  end

  def delete(word)
    @words.delete(word)
    f=File.open('dictionary.txt', 'w')
    @words.keys.each { |word| f.puts word+'|'+@words[word]}
    f.close
    get_words_from_file
  end
end
