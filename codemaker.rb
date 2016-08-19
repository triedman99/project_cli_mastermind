require_relative 'board.rb'

class Codemaker < Player

  attr_reader :colors, :code

  def initialize
    @colors = ['red', 'green', 'blue', 'yellow']
    @code = []
  end

  def create_code
    4.times do
      @code << @colors.sample
    end
    @code
  end

end
