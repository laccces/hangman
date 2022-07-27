puts "Dictionary loaded."

@game_words = []

word = File.readlines('google-10000-english-no-swears.txt')
word.each do |word|
  if word.length > 5 && word.length < 12
    @game_words << word
  end
end

array_index = Random.rand(0...6976)

computer_word = @game_words[array_index]

