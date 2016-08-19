require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'codebreaker.rb'
#require_relative 'codemaker.rb'

class Mastermind

  attr_reader :turn, :user_guess, :colors, :code, :guess_array

  def initialize
    @turn = 0
    @board = Board.new
    @user_guess = ""
    #@codemaker = Codemaker.new
    @colors = ['red', 'green', 'blue', 'yellow']
    @code = []
    @guess_array = []
  end

  def create_code
    4.times do
      @code << @colors.sample
    end
    @code
  end

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
  end

  def get_guesses
    4.times do |i|
      user_guess = gets.chomp.downcase
      @guess_array << user_guess
    end
  end

  def win?
    if @guess_array == @code
      puts "# You won! Great Job!"
      true
    else
      puts "# You lost. Better luck next time."
      puts "# The code was #{@code}"
      false
    end
  end

  def game_over?
    if win? || !win? && (@turn == 12)
      exit
    end
  end

  def turn
    counter = 0
    while @turn < 12 do
      prompt
      @board[counter] << prompt
      counter += 1
      game_over?
      @board.display_board
    end
  end

  def play
    greet
    create_code


    start
    prompt
    turn
  end

end

game = Mastermind.new
game.play
