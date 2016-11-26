require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      # self[num] << num
      self[key.hash] << key.hash
      @count += 1
      if num_buckets == count

        resize!
      end
    end
  end

  def include?(key)
    self[key.hash].include?(key.hash)
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key.hash)
    end
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

  def resize!
    flattened = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    flattened.each do |el|
      insert(el)
    end
  end
end
