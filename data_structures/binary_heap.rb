class MinHeap

  def initialize
    @storage = Array.new
  end

  def condition(i, j)
    return @storage[i] < @storage[j]
  end

  def insert(value)
    @storage << value
    bubble_up
  end

  def bubble_up
    child = @storage.size - 1
    parent = get_parent(child)
    while child > 0 && !condition(parent, child)
      swap(parent, child)
      child = parent
      parent = get_parent(child)
    end
  end

  def get_parent(child)
    return (child - 1)/2
  end

  def swap(i, j)
    @storage[i], @storage[j] = @storage[j], @storage[i]
  end

  def remove
    if @storage.size == 0
      return nil
    end
    swap(0, -1)
    result = @storage.pop
    bubble_down
    return result
  end

  def bubble_down
    parent = 0
    child = get_child(parent)
    while child && !condition(parent, child)
      swap(parent, child)
      parent = child
      child = get_child(parent)
    end
  end

  def get_child(parent)
    child_one = 2 * parent + 1
    child_two = 2 * parent + 2
    if child_one == @storage.size - 1
      return child_one
    end
    if child_one > @storage.size - 1
      return nil
    end
    return condition(child_one, child_two) ? child_one : child_two
  end


end