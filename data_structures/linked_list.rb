class Node
  attr_accessor :val, :next

  def initialize(value)
    @value = value
    @next = nil
  end

end

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(val)
    new_node = Node.new(val)

    if @size == 0
      @head = new_node
      @tail = new_node
      @size += 1
    else
      @tail.next = new_node
      @tail = @tail.next
      @size += 1
    end
  end

  def insert(insert_val, search_val)
    current_node = @head
    until current_node == nil
      if current_node.value == search_val
        reference = current_node.next
        current_node.next = Node.new(insert_val)
        current_node.next.next = reference

        if reference == nil
          @tail = current_node.next
        end
        @size += 1
      end
      current_node = current_node.next
    end
    false
  end

  def delete(location)
    if location >= 0 && @size == 0
      @head = nil
      @tail = nil
      return
    elsif location == 0
      @head = @head.next
      @size -= 1
      return
    end

    curr_node = @head
    counter = 0

    while curr_node != nil
      if counter == (location-1) && curr_node.next != nil && curr_node.next == @tail
        curr_node.next = curr_node.next.next
        @tail = curr_node
        @size -= 1
        return
      elsif counter == location-1 && curr_node.next != nil
        curr_node.next = curr_node.next.next
        @size -= 1
        return
      end
      counter += 1
      curr_node = curr_node.next
    end
    false
  end

end