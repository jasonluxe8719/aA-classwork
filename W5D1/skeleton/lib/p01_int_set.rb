class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max + 1, false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @store.length - 1
    # return false if @store[num] == true
    # @store[num] = true
    if @store.include?(num)
      return false
    else
      @store[num] = true
    end
  end

  def remove(num)
    raise "Out of bounds" if num < 0 || num > @store.length - 1
    @store[num] = false if @store[num] == true
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num
  end

  def remove(num)
    @store.each do |sub_arr|
      i = sub_arr.find_index(num)
      sub_arr.delete_at(i) if sub_arr.include?(num)
    end
  end

  def include?(num)
    @store.each do |sub_arr|
      return true if sub_arr.include?(num)
    end
    false
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(num)
    # resize! if num_buckets > 20
    if !self.include?(num)
      i = num % num_buckets
      @store[i] << num
      @count += 1
    end
    resize! if count > num_buckets
  end
  
  def remove(num)
    if self.include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end
  
  def include?(num)
    @store.each do |sub_arr|
      return true if sub_arr.include?(num)
    end
    false
  end
  
  def count
    @store.flatten.length
  end
  private
  
  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end
  
  def num_buckets
    @store.length
  end
  
  def resize!
    prev = @store
    self.store = Array.new(num_buckets * 2) {Array.new}
    prev.flatten.each { |num| insert(num) }
  end
end
