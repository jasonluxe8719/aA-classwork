require 'singleton'


class Piece
    attr_reader :color, :board, :position
    def initialize(color ='white', board = '', position = [0,0])
        @color = color
        @board = board 
        @position = position #default starting position 

        #board.add_piece(self, position)
    end 

    def to_s
    end 

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end 

    def move_into_check?(end_pos)
        #board.move_piece(position,end_position)
    end


end

class NullPiece < Piece
    include Singleton

    def initialize(color = '', board = '', position='')
        super
    end
end

module Slideable
end

class Rook < Piece
end

class Bishop < Piece 
end

class Queen < Piece 
end

module Stepable
end

class Knight < Piece 
end

class King < Piece
end

class Pawn < Piece
end