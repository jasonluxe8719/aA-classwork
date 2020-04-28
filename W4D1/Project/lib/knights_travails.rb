require_relative "./00_tree_node.rb"

class KnightPathFinder
    attr_accessor :considered_positions
    POSSIBLE_MOVES = [ 
        [-2, -1], 
        [-2, 1], 
        [2, -1],
        [2, 1],
        [1, -2],
        [1, 2],
        [-1, -2],
        [-1, 2] 
    ]

    def initialize(init_pos)
        @init_pos = init_pos
        @considered_positions = [init_pos]
        @root_node = PolyTreeNode.new(init_pos)
        build_move_tree
    end
   
    def init_pos
        @init_pos
    end

    def build_move_tree
      start_pos = @root_node
      queue = [start_pos]
      until queue.empty?
        self.new_move_positions(start_pos.value).each do |end_pos|
            child = PolyTreeNode.new(end_pos)
            start_pos.add_child(child)
            queue << child
        end
        queue.shift
        start_pos = queue[0]
     end
    end



    def self.valid_moves(pos)
        result = []
        POSSIBLE_MOVES.each do |move|
            result << [ move[0] + pos[0], move[1] + pos[1] ] if (move[0] + pos[0] < 8 && move[0] + pos[0] >= 0) && (move[1] + pos[1] < 8 && move[1] + pos[1] >= 0)
        end
        result
    end

    def new_move_positions(pos)
        new_pos = KnightPathFinder.valid_moves(pos)

        result = []

        new_pos.each do |end_pos|
            result << end_pos if !@considered_positions.include?(end_pos)
        end

        new_pos.each do |end_pos|
            @considered_positions << end_pos if !@considered_positions.include?(end_pos)
        end    
        
        result
    end
end

