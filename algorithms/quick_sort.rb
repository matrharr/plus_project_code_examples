def quicksort_in_place(arr, start, fin)
  if start >= fin
    return arr
  end
  mid = start
  for i in (start..fin)
    if arr[i] < arr[fin]
      arr[mid], arr[i] = arr[i], arr[mid]
      mid += 1
    end
  end
  arr[fin], arr[mid] = arr[mid], arr[fin]
  quicksort_in_place(arr, start, mid-1)
  quicksort_in_place(arr, mid+1, fin)
end