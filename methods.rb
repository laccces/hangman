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

def blank_board
  while @empty_board < @letter_count
    @game_board << "_"
    @empty_board += 1
  end
end

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
  puts "Guess a letter, or enter 1 to save your game."
  @letter_guess = gets.chomp.downcase
  
  if @letter_guess.length > 1
    puts "Please only enter one character. If you enter more than one character next guess, it'll count as a wrong guess."
    @letter_guess = gets.chomp.downcase
  end

  if @letter_guess == '1'
    save_game
  end
  
  if @previous_guesses.include?(@letter_guess)
    puts "You've guessed that before. Guess again. If you guess the same thing again, it'll count as a wrong guess."
    @letter_guess = gets.chomp.downcase
  end

  @previous_guesses << @letter_guess
  
end

def save_game
  Dir.mkdir 'output' unless Dir.exist? 'output'
  @filename = "last_save.yaml"
  File.open("output/#{@filename}", 'w') { |file| file.write save_to_yaml }
  puts "Game saved."
end

def save_to_yaml
  YAML.dump(
    'word' => @computer_word,
    'wrong_guesses' => @wrong_guesses,
    'game_board' => @game_board,
    'previous_guesses' => @previous_guesses,
    'letter_count' => @letter_count,
    'empty_board' => @empty_board
  )
end

def load_saved_file
  file = YAML.safe_load(File.read("output/last_save.yaml"))
  @computer_word = file['word']
  @game_board = file['game_board']
  @previous_guesses = file['previous_guesses']
  @letter_count = file['letter_count']
  @empty_board = file['empty_board']
end

