class Squasher
  attr_reader :arrays

  def initialize input
    @arrays = input
    @characters = []

    @arrays.each do |a|
      index = 0
      splitify(a).each do |piece|
        @characters[index] ||= Character.new
        @characters[index] << piece
        index += 1
      end
    end

    @fixed_lines = []
    @characters.each do |char|
      index = 0
      char.fixed.each do |line|
        @fixed_lines[index] ||= []
        @fixed_lines[index] += line
        index += 1
      end
    end
  end

  def splitify long_list
    long_list.each_slice(8)
  end

  def squashed
    @fixed_lines
  end

  class Character
    attr_accessor :lines

    def initialize
      @lines = []
    end

    def << item
      @lines << item
    end

    def fix lines
      if lines[0].reduce(:+) == 0
        lines.shift
      elsif lines[-1].reduce(:+) == 0
        lines.pop
      else
        lines.delete_at 4
      end

      lines
    end

    def fixed
      fix @lines
    end
  end
end
