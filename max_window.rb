require 'byebug'
def windowed_max_range(arr, max_size)
    current_max_range = nil
    arr.each_index do |i|
        slice = arr[i...i+max_size]
        current_max_range ||= slice.max - slice.min
        current_max_range = slice.max - slice.min if slice.max - slice.min > current_max_range
    end
    current_max_range
end

class MyQueue
    def initialize
        @que = []
    end

    def enqueue(el)
        que << el
    end

    def dequeue
        que.shift
    end

    def peek
        que.first
    end

    def size
        que.size
    end

    def empty?
        return true if que.empty?
    end

    private
    attr_accessor :que
end

class MyStack
    def initialize
        @pile = []
    end

    def push(el)
        pile << el
    end

    def pop
        pile.pop
    end

    def peek
        pile.last
    end

    def size
        pile.size
    end

    def empty?
        return true if pile.empty?
    end

    private
    attr_accessor :pile
end

#same methods as a queue but with a stack as underlying data structure instead of array
#stack 1 #full
#stack 2 #empty
#new element comes in
#empty stack (i.e. 2) gets pushed in newest element
#until 1 of the stacks is empty (i.e. 1), move all elements to other stack (i.e. 2)
#pop off and destroy top element (i.e. 2)
class StackQueue
    def initialize
        @que1 = MyStack.new
        @que2 = MyStack.new
        @current_que = @que1
    end

    def enqueue(el)
        if que2.empty? && que1.empty?
            que1 << el
            current_que = que1
            break
        end

        if current_que == que1
            que2 << el
            until que1.empty?
                que2.push(que1.pop)
            end
            current_que = que2
        else
            que1 << el
            until que2.empty?
                que1.push(que2.pop)
            end
            current_que = que1
        end
    end
        # if que2.empty? && !que1.empty?
        #     que2 << el
        #     until que1.empty?
        #         que2.push(que1.pop)
        #     end
        # end
        # if que1.empty? && !que2.empty?
        #     que1 << el
        #     until que2.empty?
        #         que1.push(que2.pop)
        #     end
        # end

    def dequeue
        current_que.pop
    end

    def peek
        current_que.last
    end

    def size
        current_que.size
    end

    def empty?
        return true if que1.empty? && que2.empty?
    end

    private
    attr_accessor :que1, :que2, :current_que
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
