require "yaml"

# starting values
def initialize
  @i = 0
  @n = 1
  @x = 0
  @y = 0
  @game_words = []
  @game_board = []
end

# load dictionary and computer guess
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

# get number of characters in word and split into an array
@letter_count = @computer_word.length 

p @computer_word.split(%r{\s*})

# generate a blank board
def blank_board
  while @n < @letter_count
    @game_board << "_"
    @n += 1
  end
end

blank_board

p @game_board

# user guess
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

# need to return something if the guess is correct - if incorrect guess (no equals) then += 1. Until 8. 

letter_checker

p @game_board

# game logic - needs updating
while @y < 9
  puts "Guess a letter."
  
  @letter_guess = gets.chomp

  letter_checker

  p @game_board

  break if @game_board == @computer_word

  
end

# if correct guess then you don't lose a mark

# if incorrect guess then you lose a mark

# need to add ability to save - YAML

=begin
  
puts "Do you want to start a new game[1], or load a game in progress[2]?"

game_choice = gets.chomp

if game_choice == 1
  initialize
end

if game_choice == 2
Load YAML

Saving
Say "If you wish to save the game and come back to it later at any point, write 'Exit' instead of guessing a letter."

end

