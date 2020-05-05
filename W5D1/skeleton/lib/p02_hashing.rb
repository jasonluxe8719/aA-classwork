class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?
    result = []
    self.each_with_index do |el, i|
      if 
      result << [el, i]
    end
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
