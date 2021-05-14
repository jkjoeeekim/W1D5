def duos(str)
    new_str = str[0]
    str.chars.inject do |char1, char2| 
        new_str += char2 if char1 != char2
        char1 = char2
    end
    str.length - new_str.length
end

# p duos('aaaple')        == 2
# p duos('bootcamp')      == 1
# p duos('wxxyzz')        == 2
# p duos('hoooraay')      == 3
# p duos('dinosaurs')     == 0
# p duos('e')             == 0


def sentence_swap(sentence, hash)
    sentence.split(" ").map! { |word| hash[word] == nil ? word : hash[word] }.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) == 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) == 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) == 'keep running okay'


def hash_mapped(hash, prc1, &prc2)
    new_hash = Hash.new
    hash.each do |key, value|
        new_hash[prc2.call(key)] = prc1.call(value)
    end
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }    == {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }    == {25=>"q", 36=>"w"}


def counted_characters(str)
    hash = Hash.new { |h, k| h[k] = 0 }
    str.chars { |char| hash[char] += 1 }
    hash.select { |k, v| v > 2 }.keys
end

# p counted_characters("that's alright folks")    == ["t"]
# p counted_characters("mississippi")             == ["i", "s"]
# p counted_characters("hot potato soup please")  == ["o", "t", " ", "p"]
# p counted_characters("runtime")                 == []


def triplet_true?(str)
    hash = Hash.new { |h, k| h[k] = 0 }
    str.chars { |char| hash[char] += 1 }
    hash.any? { |k, v| v > 2 }
end

# p triplet_true?('caaabb')        == true
# p triplet_true?('terrrrrible')   == true
# p triplet_true?('runninggg')     == true
# p triplet_true?('bootcamp')      == false
# p triplet_true?('e')             == false


def energetic_encoding(str, hash)
    str.chars.map! do |char| 
        if char == " "
            char
        elsif hash[char].nil?
            "?"
        else
            hash[char]
        end
    end.join("")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) == 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) == 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) == '?arri ?i?r?'

# p energetic_encoding('bike', {}) == '????'


def uncompress(str)
    letter = []
    times = []
    str.chars.each_with_index { |ele, idx| idx % 2 == 0 ? letter << ele : times << ele }
    letter.map.with_index { |char, idx| char * times[idx].to_i }.join("")
end

# p uncompress('a2b4c1')      == 'aabbbbc'
# p uncompress('b1o2t1')      == 'boot'
# p uncompress('x3y1x2z4')    == 'xxxyxxzzzz'