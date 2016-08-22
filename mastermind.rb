#require_relative 'board.rb'
#require_relative 'player.rb'
#require_relative 'codebreaker.rb'
#require_relative 'codemaker.rb'

class Mastermind

  attr_reader :turn, :user_guess, :colors, :code, :guess_array, :players

  def initialize
    @turn = 0
    @board = []
    @user_guess = []
    @colors = ['red', 'green', 'blue', 'yellow']
    @code = []
    @guess_array = []
    @players = 'codebreaker'
  end

  #def players?
  #  puts "# Enter whether you would like to play as the codemaker or codebreaker."
  #  puts "# ----->"
  #  @players = gets.chomp.downcase
  #  if @players == 'codebreaker'
  #    create_code
  #  elsif @players == 'codemaker'
  #    puts "# You will need to make a secret code. Choose four colors from Red, Green, Blue, Yellow. Enter them one at a time:"
  #    get_code
  #  end
  #end

  def create_code
    4.times do
      @code << @colors.sample
    end
    @code
  end

  #def get_code
  #  4.times do
  #    user_code = gets.chomp.downcase
  #    @code << user_code
  #  end
  #  @code
  #end

  def greet
    puts "# Welcome to Mastermind!"
    puts "# Good luck!"
  end

  def start
    puts "# I am making a code right now"
    puts "# ..."
    puts "# ..."
    puts "# Got it, ready to begin?"
    prompt
  end

  def prompt
    puts "# All colors are 'red', 'green', 'blue', or 'yellow'"
    puts "# Enter your guesses one guess at a time."
    puts "# What's your guess?"
    get_guesses
    puts "# You guessed #{@guess_array}"
    #puts "\n The code is #{@code} \n"
    check_guess
  end

  def get_guesses
    4.times do |i|
      @user_guess = gets.chomp.downcase
      @guess_array << @user_guess
    end
  end

  def win?
    false
    if @guess_array[-4..-1] == @code
      puts "# You won! Great Job!"
      true
    elsif @guess_array[-4..-1] != @code && @turn >= 12
      puts "# You lost. Better luck next time."
      puts "# The code was #{@code}"
      true
    end
  end

  def game_over?
    if win?
      exit
    end
  end

  def turn
    while @turn < 12 do
      @turn += 1
      @board << @user_guess
      game_over?
      prompt
    end
  end

  def check_guess
    exact = 0
    near = 0
    @guess_array[-4..-1].each_with_index do |choice, position|
      if exact?(choice, position)
        exact += 1
      elsif near?(choice)
        near += 1
      end
    end
    puts "# You had #{exact} exact match(es) and #{near} near match(es)."
  end

  def exact?(choice, position)
    choice == @code[position]
  end

  def near?(choice)
    @code.include?(choice)
  end

  def play
    greet
    #players
    create_code
    start
    prompt
    turn
  end

end

game = Mastermind.new
game.play
