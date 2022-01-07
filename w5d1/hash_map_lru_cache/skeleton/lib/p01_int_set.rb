require "set"
class MaxIntSet
  attr_reader :max
  attr_reader :store
  def initialize(max)
    @max = max 
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    store[num] = true
  end

  def remove(num)
    store.delete(num)
  end

  def include?(num)
    store.include?(num)
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)

  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod = num % num_buckets
    store[mod] << num
  end

  def remove(num)
  end

  def include?(num)
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod = num % num_buckets
    @store[mod]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
