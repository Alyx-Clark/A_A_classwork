require_relative "Board.rb"
require_relative "Game.rb"

class Card
    def initialize
        @state = state
        @values = ("a".."h").upcase.to_a
        @card_value = @values.sample
        @values.delete!(@card_value)
        @blank_side = " "
    end

    def values
      @values
    end

    def card_value
      @card_value
    end
    
    def hide
      if @state == true
        @state = false
      end
    end

    def reveal 
      if @state == false
        @state = true
      end
    end

    def to_s

    end

    def ==

    end
end