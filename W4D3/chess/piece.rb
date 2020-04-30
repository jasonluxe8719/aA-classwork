require 'singleton'
require_relative 'board'
require 'byebug'

class Piece
    attr_reader :color, :board, :symbol
    attr_accessor :position
    def initialize( board, position) #color
        @color = color
        @board = board 
        @position = position #default starting position 

        board.add_piece(self, position)
    end 
    

    # def moves 
    #     #return an array of palces a pieces can move to 
    # end 

    def to_s 
        "#{self.symbol}"
    end 

    def empty?
        #should hold a position on the board 
        false
    end


    def valid_moves
        #check moves that are available / moves that have empty spaces 
        
    end

    # def position=(val)
    #     self.position = val
    # end

    def symbol
        # '?'
    end 

    def move_into_check?(end_pos)
        #board.move_piece(position,end_position)
        #if within ending position (your next move)
        # has child as the oppponents king 
        # check = true 

    end


end

class NullPiece < Piece
    include Singleton

    attr_reader :symbol
    def initialize
        # @color
        @symbol = " "
    end

    def moves 
        []
    end 
end

module Slideable
    HOR_VERT_DIRS = [ 
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1]
    ] 
    DIAGONAL_DIRS = [
        [-1, 1],
        [1, -1],
        [-1, -1],
        [1, 1]
    ]

    def hor_vert_dirs
        HOR_VERT_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = [] 
        move_dirs.each do |dx,dy| 
            all_moves += grow_unblocked_moves_in_dir(dx, dy)
        end 
        all_moves 
    end

    # def move_dirs #X 
    #     #EITHER HOR_VERT_DIRS OR DIAGONAL_DIRS 
    #     # depends on the piece 

    #     #rook = HOR_VERT_DIRS
    #     #bishop = DIAGONAL_DIRS 
    #     #queen =  HOR_VERT_DIRS + DIAGONAL_DIRS  
    # end

    def grow_unblocked_moves_in_dir(dx, dy) #[-1, 0]
        possible_moves = [] 
        starting_x, starting_y = self.position
        i = dx 
        j = dy 
        end_position = [starting_x + i, starting_y + j ]
        while board.valid_pos?(end_position)   # hit a piece 
            if board.empty?(end_position)
                # if next position is free 
                # we can move there 
                possible_moves << end_position
            else # if we find an other colors piece, we should have an option to take that position 
                # if the end_position's piece/color is not equal to our color, enemy
                #possible_moves << end_position if board[end_position].color != color 
                #break we don't want to go futher than a enemy piece
                break
            end 

            i += dx 
            j += dy
            end_position = [starting_x + i, starting_y + j]
        end 

        possible_moves 
    end

end

class Rook < Piece
    include Slideable

    def symbol
        "R"
    end

    def move_dirs 
        hor_vert_dirs
    end
end

class Bishop < Piece 
    include Slideable

    def symbol
        "B"
    end

    def move_dirs 
        diagonal_dirs
    end

end

class Queen < Piece 
    include Slideable
    
    def symbol
        "Q"
    end

    def move_dirs 
        diagonal_dirs + hor_vert_dirs
    end
end

module Stepable
    def moves
        all_moves = [] 
        move_diffs.each do |dx, dy|
            starting_x, starting_y = self.position
            end_position = [starting_x + dx , starting_y + dy]
            next if !board.valid_pos?(end_position)

            if board.empty?(end_position) #|| board[end_position].color != self.color 
                all_moves << end_position 
            end
        end 
        all_moves 
    end 


    def move_diffs 
        #Depend on the subclass either knight or king 
    end 

end

class Knight < Piece 
    include Stepable

    def symbol
        'KN'
    end 
    
    def move_diffs
        [ 
        [1,2], 
        [-1,2], 
        [-1,-2], 
        [1,-2], 
        [-2,1], 
        [-2,-1], 
        [2,-1], 
        [2,1]
        ]
    end 
end

class King < Piece
    include Stepable

    def symbol
        "KG"
    end

    def move_diffs
        [   
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1],
        [-1, 1],
        [1, -1],
        [-1, -1],
        [1, 1]
        ]
    end
end

class Pawn < Piece

    def symbol
        "p"
    end 

    def moves
        forward_steps + side_attacks
    end 

    def at_start_row?
        # either top side or bottom side 
        #row 1 or row 6 
        self.position[0] == 1 || self.position[0] == 6
    end 

    def forward_dir 
        if self.color == "black"
            return -1
        else
            return 1
        end
        #returns 1 or -1
    end 

    def forward_steps
        starting_x, starting_y = self.position
        # starting +/- 1 
        #choosing to make 1 step 
        end_position_1 = [starting_x + forward_dir,starting_y]
        return [] if !board.valid_pos?(end_position_1) || !board.empty?(end_position_1)

        moves = [end_position_1]
        #pawns can move two steps if they are at the starting row 
        end_position_2 = [starting_x + (2 * forward_dir), starting_y]
        #if a second step is possible, that move should be allowed
        moves << end_position_2 if at_start_row? && board.empty?(end_position_2)
        moves 
    end 

    def side_attacks 
        starting_x, starting_y = self.position
        diagonal_steps =  [ [starting_x + forward_dir, starting_y - 1], [starting_x + forward_dir, starting_y + 1] ]
        moves = [] 
        diagonal_steps.each do |potential_moves|
            # can only move side if it is any enemy piece 
            # && on the board 
            if board.valid_pos?(potential_moves) #&& board[potential_moves].color != self.color  
                moves << potential_moves
            end  
        end 
        moves 
    end 

    
end