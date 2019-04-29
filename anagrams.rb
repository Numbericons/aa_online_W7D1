require 'byebug'
def first_anagram?(str1,str2)
    str1_arr = str1.split("")
    all_anas = str1_arr.permutation.to_a
    all_anas.each_with_index { |ana, i| all_anas[i] = ana.join }
    all_anas.include?(str2)
end

# p "First anagram below should return true"
# p first_anagram?("cat", "tac")

# p "First anagrams below should return false"
# p first_anagram?("borky", "zeeky")

def second_anagram?(str1,str2)
    debugger
    str2_arr = str2.split("")
    str1.each_char do |letter|
        idx = str2_arr.find_index(letter)
        str2_arr.delete_at(idx) if idx
    end
    str2_arr.length == 0
end

# p "Second anagram below should return true"
# p second_anagram?("cat", "tac")

# p "Second anagrams below should return false"
# p second_anagram?("borky", "zeeky")

def third_anagram?(str1, str2)
    str1 = str1.split("").sort 
    str2 = str2.split("").sort
    str1 == str2
end

#n + n 

# p "Third anagram below should return true"
# p third_anagram?("cat", "tac")

# p "Third anagrams below should return false"
# p third_anagram?("borky", "zeeky")

# def fourth_anagram?(str1, str2)
#     cnt_hash1 = Hash.new(0)
#     cnt_hash2 = Hash.new(0)
#     str1.each_char { |letter| cnt_hash1[letter] +=1 }
#     str2.each_char { |letter| cnt_hash2[letter] +=1 }
#     cnt_hash1 == cnt_hash2
# end

def fourth_anagram?(str1, str2)
    cnt_hash = Hash.new(0)
    str1.each_char { |letter| cnt_hash[letter] +=1 }
    str2.each_char { |letter| cnt_hash[letter] +=1 }
    cnt_hash.keys.length == str1.split("").uniq.count && cnt_hash.all? { |k,v| v.even? }
end

#check that value are even and # of keys == count of uniq chars in str1 || str2

p "Fourth anagram below should return true"
p fourth_anagram?("cat", "tac")

p "Fourth anagrams below should return false"
p fourth_anagram?("borky", "zeeky")

p "Fourth anagram below should return true"
p fourth_anagram?("ccaatt", "ttaacc")