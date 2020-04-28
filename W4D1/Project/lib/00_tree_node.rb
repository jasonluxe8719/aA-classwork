class PolyTreeNode
    attr_writer :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def value
        @value
    end

    def children
        @children
    end

    def parent=(node1)
        if !self.parent.nil?
            self.parent.children.reject! { |child| child == self}
        end
        
        @parent = node1


        if node1.nil?
            return nil
        else
            node1.children << self if !node1.children.include?(self)
        end

        
    end

    def add_child(child)
        # self.children << child if !self.children.include?(child)
        child.parent = self if !self.children.include?(child)
    end

    def remove_child(child)
        child.parent = nil
        raise "ERROR" if child.parent.nil?
    end
    

    def dfs(target)
        return nil if self.nil?
        return self if self.value == target
        self.children.each do |child|
            res = child.dfs(target)
            return res if !res.nil?
        end
        nil
    end
    
    def bfs(target)
        
        return nil if self.nil?
        return self if self.value == target
        
        queue = []
        current_node = self
        queue << current_node #[a]
        while queue.length > 0
            current_node.children.each do |child|
                if child.value == target 
                    return child
                else
                    queue << child #[a, b, c]
                end
            end
            queue.shift #[b, c]
            current_node = queue[0] #current_node = b
            #queue = [d, e, f, g]
        end
        nil
    end


    
end

    
