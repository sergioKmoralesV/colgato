require 'admin'

describe WordAdmin do
  before :each do
   @admin = WordAdmin.new
  end

  it 'gets all the words from doc' do
    @admin.get_words_from_file
    expect(@admin.words.size).not_to eq 0
  end

  it 'adds new word' do
    @admin.get_words_from_file
    expect(@admin.new_word('otorrinolaringología')).to eq 'otorrinolaringología'
    @admin.delete('otorrinolaringología')
  end

  it 'adds existing word' do
    @admin.get_words_from_file
    expect(@admin.new_word(@admin.words.first)).to eq 'Ya existe'
  end

  it 'deletes a word' do
    @admin.get_words_from_file
    @word=@admin.words.first
    @admin.delete(@admin.words.first)
    expect(@admin.words.include?(@word)).to eq false
    @admin.new_word(@word)
  end
end
