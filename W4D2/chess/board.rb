require_relative "piece"

class Board

    def initialize
        #@sentinel =  NullPiece.instance
        @board = Array.new(8) {Array.new(8, ' ')}

    end

    def [](pos)
        i,j = pos  
        @board[i][j]
    end 

    def []=(pos, value)
        i,j = pos  
        @board[i][j] = value
    end 
 
    def empty?(position)
        self[position] = ' '
    end 
    def move_piece(start_pos, end_pos) #color
        # raise "starting position has no piece" if self.empty?(start_pos)
        # raise "end position is occupied" if !self.empty?(start_pos)
        #want to grab piece and move it to end_pos

        add_piece(self[start_pos], end_pos)
        self[start_pos] = nil
    end

    # def valid_pos?(pos)
    # end 

    def add_piece(piece,pos)
        self[pos] = piece
    end

    # def empty?(pos)
    #     self[pos].empty?
    # end 

    # def check_mate?(color)
    # end 


    # def in_check?(color)
    # end 

    # def find_king(color)
    # end 

    # def pieces 
    # end 

    # def dup 
    # end 

    # def move_piece!(color,start_pos, end_pos)
    # end

  
end


if $PROGRAM_NAME == __FILE__
    b = Board.new
    p = Piece.new 

    p b.add_piece(p, p.position)

    p b

    p b.move_piece(p.position, [4,4])
    p b
end 