puts "Dictionary loaded."

@game_words = []

word = File.readlines('google-10000-english-no-swears.txt')
word.each do |word|
  if word.length > 5 && word.length < 12
    @game_words << word
  end
end

puts @game_words

#make the list into an array

#use a random number to pick a word

