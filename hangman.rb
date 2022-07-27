puts "Dictionary loaded."

@i = 0
@game_words = []

def choose_word
  word = File.readlines('google-10000-english-no-swears.txt')
  word.each do |word|
    if word.length > 5 && word.length < 12
      @game_words << word
    end
  end

  array_index = Random.rand(0...6976)

  @computer_word = @game_words[array_index]
end

choose_word

letter_count = @computer_word.length 

p @computer_word.split(%r{\s*})



puts "Guess a letter."

#while @i < 9

#end