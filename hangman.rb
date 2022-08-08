@empty_board = 1
@x = 0
@wrong_guesses = 0
@correct_guess = 0
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
  while @empty_board < @letter_count
    @game_board << "_"
    @empty_board += 1
  end
end

blank_board
p @game_board

def letter_checker
  while @x < @letter_count
    if @computer_word[@x].eql?(@letter_guess)
      @game_board[@x] = @letter_guess
      @correct_guess += 1
    end
    @x += 1
  end
  if @correct_guess == 0
    @wrong_guess = "yes"
    @wrong_guesses += 1
  end
end

def wrap_up
  if @correct_guess >= 1
    puts "Congrats, that letter was right!"
  end

  if @wrong_guess == "yes"
    puts "Sorry, that was wrong. You can get it wrong #{8 - @wrong_guesses} more times before it's game over."
  end

  @wrong_guess = "no"
end

def user_guess
  puts "Guess a letter."
  @letter_guess = gets.chomp
end

def play_game
  user_guess
  letter_checker
  @x = 0
  wrap_up
  p @letter_guess
  p @game_board
end

while @wrong_guesses <= 8
  play_game
  @correct_guess = 0
  break if @game_board == @computer_word
end

if @game_board == @computer_word
  puts "You win!"
end

if @wrong_guesses == 8
  puts "Sorry, you lose."
end

