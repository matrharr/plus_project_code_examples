def binary_search(array, value, min=0, max=nil)

  if max == nil
    max = array.length - 1
  end

  if min > max
    return false
  end

  mid = (min + max) / 2

  if value < array[mid]
    return binary_search(array, value, min, mid - 1)
  elsif value > array[mid]
    return binary_search(array, value, mid + 1, max)
  else
    return true
  end

end