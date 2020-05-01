require 'byebug'
def my_uniq(arr)
    new_hash = Hash.new
    arr.each { |ele| new_hash[ele] = true }
    new_hash.keys
end

class Array
    def two_sum
      result = []
      (0...self.length).each do |i|
        (0...self.length).each do |j|
          result << [i,j] if self[i] + self[j] == 0 && j > i
        end
      end
      result
    end
end

def my_transpose(arr)
  result = []
  (0...arr.length).each do |i|
    sub_arr = []
    arr.each do |subarr|
      sub_arr << subarr[i]
    end
    result << sub_arr
  end
  result
end

def stock_picker(arr)
    high_return = 0
    pair = []
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2|
            if idx2 > idx1 && ((num1 - num2) > high_return)
                high_return = num1 - num2
                pair = [arr[idx1], arr[idx2]]
            end
        end
    end
    pair
end

class TowerOfHanoi
    attr_reader :board
    attr_writer :board

    def initialize
        @board = Array.new(3) {Array.new}
        board[0] = [3, 2, 1]
    end

    def get_pos
        puts 'choose a start pile and end pile'
        gets.chomp.split.map(&:to_i)
    end

    def move(pos)
      start_pile, end_pile = pos

      unless board[end_pile].empty?
        raise 'Invalid Move'  if (board[start_pile][-1] > board[end_pile][-1])
      end

      disc = board[start_pile].pop
      board[end_pile].push(disc)
      board
    end

    def won?
        board.last == [3, 2, 1]
    end

    # def play
    #   pos = get_pos
    #   move(pos)
    # end
end


