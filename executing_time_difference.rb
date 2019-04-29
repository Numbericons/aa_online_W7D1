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

p "Below is a call to phase 1 of #my_min"
p my_min_p1(list)  # =>  -5

p "Below is a call to phase 2 of #my_min"
p my_min_p2(list)  # =>  -5