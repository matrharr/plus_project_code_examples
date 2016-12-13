def constant_method(array)
  mid = (array.length-1)/2

  answer = array[mid]

  5.times do
    puts 'constant time!'
  end

  return answer
end


def logarithmic_time(array)
  until array.length <= 1
    mid = (array.length-1)/2
    array = array[0..mid]
  end
  return array
end


def linear_time(array)
  new_arr = array

  new_arr.map do |element|
    if element.even?
      return true
    end
  end

end


def quadratic_time(array)
  array.each_with_index do |element_1, idx_1|
    array.each_with_index do |element_2, idx_2|
      if element_1 == element_2 && idx_1 != idx_2
        return true
      end
    end
  end
  return false
end


