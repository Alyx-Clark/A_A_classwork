require_relative "Game.rb"
require_relative "Card.rb"

class Board
  
  def self.generate                     #class
    (@size/2).times do 
      @cards << @card.card_value
    end
  end
  @values = ("a".."h").upcase.to_a
  @card_value = @values.sample
  @values.delete!(@card_value)
  def self.populate
    val = @dbl_cards.sample
    @dbl_cards.delete!
    row = rand(0...@grid.length)
    col = rand(0...@grid.length)
    pos = [row, col]
    if self.space_free?(pos)
      [pos] = val
    end
  end

  def initialize(4)
    @grid = Array.new(4) { Array.new(4, "") }
    @size = n * n    
    @cards = []
    @dbl_cards = @cards.dup.concat(@cards)
    @card = Card.new
  end

  def size 
    @size
  end

  def space_free?(pos)
    return true if @grid[pos] = ""
  end



  def render 
  end

  def won?
  end

  def reveal
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end



  


end