require 'byebug'

class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def push_child(child_node)
        @children << child_node
        children
    end


    def parent=(parent_node = nil)
        old_parent = parent
        old_parent.children.delete(self) unless parent.nil?
        @parent = parent_node
        unless parent.nil?
            unless parent_node.children.include?(self)
                parent_node.push_child(self)
            end
        end

        parent
    end
    #self = parent_node 
    def add_child(child_node)
        child_node.parent = self
        children
    end

    def remove_child(child_node)
        raise unless children.include?(child_node)
        child_node.parent = nil
        children
    end

    def inspect
        {"value"=>@value,
        "parent_value"=>@parent.value,
        "children"=>@children
    }.inspect
    end

    def dfs(target)
        return self if self.value == target
        unless children == []
            children.each do |node|
                var = node.dfs(target)
                return var unless var.nil?
            end
        end
        return
    end 

    def bfs(target)
        q = []
        q << self
        until q.empty?
            check = q.shift
            if check.value == target
                return check
            else
                q.concat(check.children)
            end
        end
        nil
    end

end