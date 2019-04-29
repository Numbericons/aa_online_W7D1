require 'byebug'
def bad_two_sum?(arr,target)
    # pair_sums = []
    arr.each_index do |i|
        arr.each_index do |j|
            next if i >= j
            return true if arr[i] + arr[j] == target
        end
    end
    false
    # pair_sums.include?(target)
end

#first idea
#   iterate through array, and nest an iteration
#   check if the outer enumerable value + the inner enumerable value == target
#   if so return true, else return false

# arr = [0, 1, 5, 7]
# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

#time complexity is O(n^2)

#first idea
#   sort the data
#   allow us to iterate through the array once as we can check the current element and the next element (if it exists)
# def bsearch?(arr,target)
#     if arr.length == 1
#         return true if arr[0] == target
#     else
#         return false
#     end
#     mid = arr.length / 2
#     return true if arr[mid] == target
#     if arr[mid] > target
#         bsearch?(arr[0...mid])
#     else
#         bsearch?(arr[mid+1..-1])
#     end
# end

def okay_two_sum?(arr,target)
    arr.sort!
    i, j = 0, arr.length - 1

    while i < j
        case (arr[i] + arr[j]) <=> target
        when 0
            return true
        when -1
            i+=1
        when 1
            j-=1
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
    my_hash = Hash.new
    arr.each { |num| my_hash[num] = num }
    # debugger
    arr.each do |number|
        if my_hash[target - number]
            return true unless target - number == number
        end
    end
    false
end

arr = [0, 1, 5, 7]
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

load 'max_window.rb'
# t = MyQueue.new
# t.peek
# t.enqueue(1)
# t.peek
x = MyStack.new
x.peek
x.push(1)
x.push(2)
x.push(3)
x.pop
x.peek