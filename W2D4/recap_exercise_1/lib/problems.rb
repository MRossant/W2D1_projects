# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

=begin
    result = []
    init vowels = "aeiou"
    outer loop thru words
    inner loop thru words => check if both words have all vowels among them
    if true then result << word_1 + " " + word_2
    
    return result
=end

def all_vowel_pairs(words)
    result = []
    words.each.with_index do |word_1, idx_1|
        words.each.with_index do |word_2, idx_2|
            if idx_1 < idx_2 && has_all_vowels?(word_1, word_2)
                result << word_1 + " " + word_2
            end
        end
    end
    result
end

def has_all_vowels?(word_1, word_2)
    h = {
        "a" => 0,
        "e" => 0,
        "i" => 0,
        "o" => 0,
        "u" => 0
    }

    word_1.each_char {|char| h[char] += 1 if h.has_key?(char)}
    word_2.each_char {|char| h[char] += 1 if h.has_key?(char)}

    # checks if both words have all vowels
    !h.has_value?(0)
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false

=begin
    loop thru num from 2...num
=end

def composite?(num)
    (2...num).any? {|fact| num % fact == 0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    str.delete!(" ")
    result = []
    bigrams.each do |bigram|
        i = 0
        while i < str.length - 1
            bi = str[i] + str[i + 1]
            result << bi if bigram == bi
            i += 1
        end
    end

    result
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {}
        prc ||= Proc.new {|k, v| k == v}

        self.each do |k, v|
            if prc.call(k, v)
                new_hash[k] = v
            end
        end

        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        (0...self.length).each do |start_idx|
            (start_idx...self.length).each do |end_idx|
                subs << self[start_idx..end_idx]
            end
        end

        if length == nil
            return subs
        else
            subs.select {|el| el.length == length}
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ""
        self.each_char.with_index do |char, i|
            current_idx = alpha.index(char)
            new_idx = current_idx + num
            new_char = alpha[new_idx % alpha.length]
            new_str += new_char
        end

        new_str
    end
end
