class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return_hash = 0

    # each_with_index { |el, index| return_hash += el.hash * index.hash }
    each_with_index do |el, index|
      if el == []
        return_hash += index.hash
      else
        return_hash += el.hash * index.hash
      end
    end

    return_hash
  end
end

class String
  def hash
    return_hash = 0
    self.chars.map(&:ord).each_with_index {|el, index| return_hash += el.hash * index.hash}
    return_hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    return_hash = 0
    self.to_a.each do |key_val_pair|
      return_hash += key_val_pair.hash
    end
    return_hash
  end
end

# a = {a: "a", b: "b"}
# b = {a: "a", b: "b"}
#
#
# b = {"a" => "b"}
# b = {"b" => "a"}
#
# p a.keys
# p b.keys
