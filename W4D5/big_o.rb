def my_min1(array) #O(n^2)
   array.find { |ele| array.none? { |ele2| ele2 < ele } }
end

#  array = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#  p my_min1(array)

def my_min2(array) #O(n)
    min = array.first
    array.each do |num|
        min = num if num < min
    end
    min
end

# p my_min2(array)

def largest_contiguous_subsum1(list) #O(n^2)
    result = []

    (0...list.length).each do |i|
        (i...list.length).each do |j|
            result << list[i..j]
        end
    end

    max = result.first
    result.each do |ele|
        max = ele if ele.sum > max.sum
    end
    max.sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum1(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum1(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum1(list)

def largest_contiguous_subsum2(list)

    current_sum = 0
    sum_so_far = list.first

    list.each do |num|
        if num > sum_so_far
            current_sum = num
        else
            current_sum += num
        end
        sum_so_far = current_sum if current_sum > sum_so_far
    end

    sum_so_far

    # right_current_sum = 0
    # right_sum_so_far = 0

    # (0...list.length).reverse_each do |idx|
    #     right_current_sum += list[idx] # -3
    #     if right_current_sum > right_sum_so_far
    #         right_sum_so_far = right_current_sum
    #         left_idx = idx
    #     end
    # end

    # list[left_idx..right_idx].sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum2(list)

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum2(list)

# list = [-5, -1, -3]
# p largest_contiguous_subsum2(list)


def first_anagram?(str1, str2)
    arr1 = str1.split("")
    ana1 = arr1.permutation(str1.length).to_a
    res1 = []
    ana1.each do |anagram|
        res1 << anagram.join("")
    end
    res1.include?(str2)
end

# p first_anagram?("acb", "abc")

def second_anagram?(str1, str2) # O(n^2)
    arr = str2.split("")
    str1.each_char do |char| # O(n)
        idx = arr.find_index(char) # O(n)
        if !idx.nil?
            arr.delete_at(idx)
        else
            return false
        end
    end
    arr.empty?
end

# p second_anagram?("elvis", "livess")

def third_anagram?(str1, str2)
    arr1 = str1.split("").sort
    arr2 = str2.split("").sort
    arr1 == arr2
end

# p third_anagram?("elvis", "lives")

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char do |char| # O(n)
        hash1[char] += 1 # O(1)
    end

    str2.each_char do |char| # O(n)
        hash2[char] += 1 # O(1)
    end

    hash1 == hash2

end

# p fourth_anagram?("elvis", "livess")

def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

arr = [1, 5, 7, 0, 5]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum) #bsearch = log n => n * log n
    sorted_arr = arr.sort #.sort => n * log n
    sorted_arr.each_index do |i|
        j = sorted_arr.bsearch_index { |n| n + sorted_arr[i] == target_sum }
        return true if !j.nil? && j != i
    end
    false
end

# p okay_two_sum?(arr, 6)
# p okay_two_sum?(arr, 10)


def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each_with_index do |num, idx|
        hash[num] = idx
    end
    arr.each_with_index do |num, idx|
        return true if hash.has_key?(target_sum - num) && idx != hash[target_sum - num]
    end
    false
end

# p two_sum?(arr, 6)
# p two_sum?(arr, 10)

def windowed_max_range(arr, window_size)
    arr.each_cons(window_size).max_by { |sub_array| sub_array.max - sub_array.min }
           # O(n)      +        O(n *                 ( O(n)      +    O(n))  )
end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2)
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3)
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4)
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5)



