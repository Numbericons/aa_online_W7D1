require 'byebug'
def my_min_p1(list)
    list.each do |num|
        return num if list.all? { |num_in| num_in >= num }
    end
end
def my_min_p2(list)
    minimum = nil
    list.each do|num|
        minimum = num if minimum.nil? || num < minimum
    end
    minimum
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p "Below is a call to phase 1 of #my_min"
# p my_min_p1(list)  # =>  -5

# p "Below is a call to phase 2 of #my_min"
# p my_min_p2(list)  # =>  -5

def largest_contiguous_subsum(list)
    sub_arrs = []

    list.each_with_index do |el, i|
        list.each_with_index do |el_in, j|
            next if i > j
            sub_arrs << list[i..j]
        end
    end
    largest = nil
    sub_arrs.each_with_index do |sub, i|
        sum = sub.reduce(:+)
        largest = sum if largest.nil? || sum > largest 
    end
    largest
end


list = [2, 3, -6, 7, -6, 7]
p "Below is largest contiguous sum phase 1, should equal 8"
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p "Below is largest contiguous sum phase 1, should equal -1"
p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_contiguous_subsum_p2(list)
    return list.max if list.all? { |num| num < 0 }
    largest = list.first
    current = list.first
    list.drop(1).each do |num|
        current = 0 if current < 0
        current +=num
        largest = current if current > largest
    end
    largest
end

list = [2, 3, -6, 7, -6, 7]
p "Below is largest contiguous sum phase 2, should equal 8"
p largest_contiguous_subsum_p2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p "Below is largest contiguous sum phase 2, should equal -1"
p largest_contiguous_subsum_p2(list) # => -1 (from [-1])