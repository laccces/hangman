require 'yaml'
require_relative 'methods'

@empty_board = 1
@x = 0
@wrong_guesses = 0
@correct_guess = 0
@y = 0
@game_words = []
@game_board = []
@previous_guesses = []

puts "Hangman. Would you like to 1) Start a new game or 2) Load your last saved game?"

start_choice = gets.chomp

if start_choice == '1'

  choose_word
  
  @letter_count = @computer_word.length 
  
  @computer_word = @computer_word.split(%r{\s*})
  
  blank_board
  p @game_board
  
  def play_game
    user_guess
    puts "Your guess was #{@letter_guess}"
    letter_checker
    @x = 0
    wrap_up
    p @game_board
  end
  
  while @wrong_guesses < 8
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
end

if start_choice == '2'
  load_saved_file
  p @game_board
  
  def play_game
    user_guess
    puts "Your guess was #{@letter_guess}"
    letter_checker
    @x = 0
    wrap_up
    p @game_board
  end

  while @wrong_guesses < 8
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
end







