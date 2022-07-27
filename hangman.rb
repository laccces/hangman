puts "Dictionary loaded."

word_array = []

word = File.readlines('google-10000-english-no-swears.txt')
word.each do |word|
  if word.length > 5 && word.length < 12
    puts word
  end
end

#make the list into an array

#use a random number to pick a word

