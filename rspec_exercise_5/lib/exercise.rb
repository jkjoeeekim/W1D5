require 'byebug'

def zip(*arrays)
    arrays.transpose
end

def prizz_proc(array, prc1, prc2)
    array.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
end

def zany_zip(*arrays)
    max = arrays.map(&:size).max
    new_array = Array.new(max){ Array.new(arrays.length, nil) }
    arrays.each_with_index do |array, idx1|
        array.each_with_index do |ele, idx2|
            new_array[idx2][idx1] = ele
        end
    end
    new_array
end

def maximum(array, &prc)
    max = 0
    array.select! do |ele|
        if prc.call(ele) && prc.call(ele) >= max
            max = prc.call(ele)
            prc.call(ele)
        end
    end
    array.last
end

def my_group_by(array, &prc)
    hash = Hash.new{ |h, k| h[k] = [] }

    array.each do |ele|
        # debugger
        hash[prc.call(ele)] << ele
    end

    hash
end

def max_tie_breaker(array, prc1, &prc2)
    array.inject do |ele1, ele2|
        if prc2.call(ele1) == prc2.call(ele2) && prc1.call(ele1) == prc1.call(ele1)
            ele1
        elsif prc2.call(ele1) == prc2.call(ele2)
            prc1.call(ele1) > prc1.call(ele2) ? ele1 : ele2
        else
            prc2.call(ele1) > prc2.call(ele2) ? ele1 : ele2
        end
    end
end

def silly_syllables(sentence)
    new_sentence = []
    sentence.split(" ").each do |word|
        new_word = ""
        if word.chars.count { |char| "aeiou".include?(char.downcase) } < 2
            new_word = word
        else
            new_word = word[word.index(/[aeiou]/)..word.rindex(/[aeiou]/)]
        end
        new_sentence << new_word
    end
    new_sentence.join(" ")
end