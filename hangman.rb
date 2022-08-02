@i = 0
@n = 1
@x = 0
@y = 0
@game_words = []
@game_board = []

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

@letter_count = @computer_word.length 

p @computer_word.split(%r{\s*})

def blank_board
  while @n < @letter_count
    @game_board << "_"
    @n += 1
  end
end

blank_board

p @game_board

puts "Guess a letter."

@letter_guess = gets.chomp

def letter_checker
  while @x < @letter_count
    if @computer_word[@x].eql?(@letter_guess)
      @game_board[@x] = @letter_guess
    end
  @x += 1
  end
end



letter_checker

p @game_board

while @y < 9
  puts "Guess a letter."
  
  @letter_guess = gets.chomp

  letter_checker

  p @game_board

  break if @game_board == @computer_word

  @y += 1
end