def conjunct_select(array, *prcs)
    array.select { |ele| prcs.all? { |prc| prc.call(ele) } }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive)                           == [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd)                   == [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten)    == [7]


def convert_pig_latin(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    words.map! do |word|
        first_vowel_idx = word.index(/[aeiou]/)
        if word.length < 3
            word
        elsif vowels.include?(word[0].downcase)
            word + "yay"
        elsif word[0] == word[0].upcase
            word[first_vowel_idx].upcase + word[(first_vowel_idx + 1)..-1] + word[0].downcase + word[1...first_vowel_idx] + "ay"
        else
            word[first_vowel_idx..-1] + word[0...first_vowel_idx] + "ay"
        end
    end
    words.join(" ")
end

# p convert_pig_latin('We like to eat bananas')       == "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash')      == "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem')  == "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France')    == "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France')    == "Ouryay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Bye')


def reverberate(sentence)
    words = sentence.split(" ")
    vowels = "aeiou"
    words.map! do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[-1].downcase)
            word + word.downcase
        else
            word + word[word.rindex(/[aeiou]/)..-1].downcase
        end
    end
    words.join(" ")
end

# p reverberate('We like to go running fast') == "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash')   == "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish')  == "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France')  == "Herer familyily flewew to Francefrance"


def disjunct_select(array, *prcs)
    array.select do |ele|
        prcs.any? { |prc| prc.call(ele) }
    end
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) == ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) == ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) == ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sentence)

end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sentence)

end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    characters = str.split("")
    compressed = ""
    previous_char = ""
    removed = false
    count = 1
    characters.each_with_index do |char, idx|
        if (char == previous_char) && ((characters.length - 1) == idx)
            count += 1
            compressed += "#{count}"
        elsif char == previous_char
            count += 1
        elsif char != previous_char && count == 1
            compressed += char
        else
            compressed += "#{count}"
            compressed += char
            count = 1
        end
        previous_char = char
    end
    compressed
end

# p compress('aabbbbc')       == "a2b4c"
# p compress('boot')          == "bo2t"
# p compress('xxxyxxzzzz')    == "x3yx2z4"