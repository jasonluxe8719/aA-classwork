require_relative "piece"

class Board
    attr_reader :sentinel
    def initialize
        @sentinel =  NullPiece.instance
        @board = Array.new(8) {Array.new(8, @sentinel)}
        fill_board 
        #render
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
        self[position] == sentinel
    end 


    #
    def move_piece(start_pos, end_pos) #color
        piece = self[start_pos]

        raise "starting position has no piece" if self.empty?(start_pos)
        raise "end position is occupied" if !self.empty?(end_pos)
        #want to grab piece and move it to end_pos

        #end_pos must be in our pieces moveset 

        raise "not in move set" if !piece.moves.include?(end_pos)
   
        piece = self[start_pos]
        piece.position = end_pos
        self[end_pos] = piece
        self[start_pos] = sentinel

        print 'move successful'       
    end

    def valid_pos?(pos)
        (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8)
      
    end 

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

    def fill_board
        fill_top_board
        fill_bot_board
        fill_top_pawns
        fill_bot_pawns
    end 
    def fill_top_board
        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

        pieces.each_with_index do |piece, i|
            piece.new(self, [0,i])
        end
    end 

    def fill_top_pawns
        (0...8).each do |i|
            Pawn.new(self,[1,i])
        end
    end 


    def fill_bot_pawns
        (0...8).each do |i|
            Pawn.new(self,[6,i])
        end
    end 

    def fill_bot_board
        pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

        pieces.each_with_index do |piece, i|
            piece.new(self, [7,i])
        end
    end 
  
    def render 
        @board.map do |pos|
            pos.map do |piece|
                piece.to_s
            end
        end
    end 

    def inspect
        "board"
    end
end


if $PROGRAM_NAME == __FILE__
    b = Board.new
    p b.render
    # b.move_piece([6,3],[4,3])
    b.move_piece([0,1],[2,0])
    # b.move_piece([6,1], [4,1])
    p b[[7,2]].moves

   

   

    
end 