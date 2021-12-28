module Slideable  
    HORIZONTAL_DIRS = [
        [0, 1], [0, -1], # right or left
        [1, 0], [-1, 0] # up or down
    ].freeze

    DIAGONAL_DIRS = [
        [1, 1], [1, -1],
        [-1, -1], [-1, 1]
    ].freeze

    def horizontal_dirs 
        HORIZONTAL_DIRS.each do |(dx, dy)|

        end
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves 
        moves_result = []
        move_dirs.each do |dx, dy|
            moves_result << grow_unblocked_moves_in_dir(dx, dy)
        end
        moves_result
    end

    private
    def move_dirs
        
    end
        
    def grow_unblocked_moves_in_dir(dx, dy)
        end_pos = []
        cur_x, cur_y = self.pos
        new_x = cur_x + dx
        new_y = cur_y + dy
        new_pos = [new_x, new_y] 
                                    
        while true
            break unless self.board.valid_pos?(new_pos)
            break if self.board[new_pos].color == self.color
            end_pos = new_pos
            break if self.board[new_pos].color != self.color && !self.board[new_pos].color.nil?

            new_x += dx
            new_y += dy
            new_pos = [new_x, new_y] 
        end
        end_pos
    end
end