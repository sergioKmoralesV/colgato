require 'admin'

describe WordAdmin do
  before :each do
   @admin = WordAdmin.new
  end

  it 'gets all the words from doc' do
    @admin.get_words_from_file
    expect(@admin.words.keys.size).not_to eq 0
  end

  it 'adds new word' do
    @admin.get_words_from_file
    expect(@admin.new_word('otorrinolaringologia',' ')).to eq 'otorrinolaringologia'
    @admin.delete('otorrinolaringologia')
  end

  it 'adds existing word' do
    @admin.get_words_from_file
    @word=@admin.get_word
    @description=@admin.get_description_of_word(@word.join)
    expect(@admin.new_word(@word.join,@description)).to eq 'Ya existe'
  end

  it 'deletes a word' do
    @admin.get_words_from_file
    @word=@admin.get_word
    @description=@admin.get_description_of_word(@word.join)
    @admin.delete(@word.join)
    expect(@admin.words[@word]).to eq nil
    @admin.new_word(@word.join,@description)
  end

  it 'gets a word from dictionary' do
    @admin.get_words_from_file
    @word=@admin.get_word
    expect(@admin.words.include?(@word.join)).to eq true
  end
  it 'gets the description of the word I am using' do
    @admin.get_words_from_file
    @word=@admin.get_word
    @description=@admin.get_description_of_word(@word.join)
    expect(@admin.words[@word.join]==@description).to eq true
  end
end
