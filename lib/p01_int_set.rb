require 'byebug'

class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    if is_valid?(num)
      unless include?(num)
        @store[num - 1] = true
      end
    end
  end

  def remove(num)
    if is_valid?(num)
      if include?(num)
        @store[num - 1] = false
      end
    end
  end

  def include?(num)
    @store[num - 1] == true
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num < 1 || num > @store.count
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless include?(num)
      self[num] << num
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num_mod = num % num_buckets
    @store[num_mod]
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
    unless include?(num)
      self[num] << num
      @count += 1
      if num_buckets == count

        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    num_mod = num % num_buckets
    @store[num_mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
    flattened = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    flattened.each do |el|
      insert(el)
    end

  end
end
