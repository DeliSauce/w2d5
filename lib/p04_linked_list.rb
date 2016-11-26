class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Link.new()
    @tail = Link.new()
    @head.next = @tail
    @tail.prev = @head

    # @head = nil
    # @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.key.nil? #&& @tail.key.nil?
  end

  def get(key)
    current_link = @head
    while true
      if current_link == @tail
        return current_link.val if current_link.key == key
        return nil
      else
        return current_link.val if current_link.key == key
        current_link = current_link.next
      end
    end
  end

  def include?(key)
    current_link = @head
    while true
      if current_link == @tail
        return true if current_link.key == key
        return false
      else
        return true if current_link.key == key
        current_link = current_link.next
      end
    end
  end

  def append(key, val)
    if empty?
      @head.key = key
      @head.val = val
    elsif @tail.key.nil?
      @tail.key = key
      @tail.val = val
    else
      new_link = Link.new(key, val)
      new_link.prev = @tail
      @tail.next = new_link
      @tail = new_link
      # p @tail
    end
  end

  def update(key, val)
    # if include?(key)
    #   self[key].val = val
    # end
    current_link = @head
    while true
      if current_link == @tail
        return current_link.val = val if current_link.key == key
        return nil
      else
        return current_link.val = val if current_link.key == key
        current_link = current_link.next
      end
    end

  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
