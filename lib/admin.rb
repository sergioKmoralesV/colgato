class WordAdmin
  attr_accessor :words, :exists
  def initialize
    @words=Array.new
    get_words_from_file
  end

  def get_word
    get_words_from_file
    @words[rand(0..(@words.size-1))].split('')
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
    @resp=''
    File.open('text.txt', 'a') do |f|
      if !@words.include?(word)
        f.puts word
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
    f=File.open('text.txt', 'w')
    @words.each { |word| f.puts word}
    f.close
    get_words_from_file
  end
end
