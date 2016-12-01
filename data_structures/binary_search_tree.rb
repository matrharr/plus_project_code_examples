class Node
  attr_accessor :value, :right_child, :left_child

  def initialize(val)
    @value = val
    @right_child = nil
    @left_child = nil
  end

end


class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
    @size = 0
  end

  def insert(val)
    #if less, falls to the left
    #if greater, falls to right
    if @root == nil
      @root = Node.new(val)
      @size += 1
    else

      def find_and_insert(curr_node, val)
        if val > curr_node.val
          #belongs in rightchild
          if curr_node.rightChild == nil
            curr_node.rightChild = Node.new(val)
          else
            find_and_insert(curr_node.rightChild, val)
          end
        elsif val < curr_node.val
          #belongs in leftchild
          if curr_node.leftChild == nil
            curr_node.leftChild = Node.new(val)
          else
            find_and_insert(curr_node.leftChild, val)
          end
        end
      end
      find_and_insert(@root, val)
      @size += 1
    end
  end

  def search(target)
    @check = false

    def traverse(current_node, target)
      if current_node == nil
        return
      elsif current_node.value == target
        @check = true
        return
      end

      if current_node.value < target
        traverse(current_node.right_child, target)
      elsif current_node.value > target
        traverse(current_node.left_child, target)
      end
    end

    traverse(@root, target)
    @check
  end

  def remove(delete_val)

    def round_up(current_node, target)

      if current_node == nil
        return
      end

      storage = []

      if current_node.value != target
        storage << current_node.value
      end

      round_up(current_node.left_child, target)
      round_up(current_node.right_child, target)
    end

    round_up(@root, delete_val)

    @root = nil
    @size = 0

    storage.each do |val|
      self.insert(val)
    end

    return storage
  end

  def remove_in_place(delete_val)
    if !self.search(delete_val)
      puts "Value does not exist"
    else
      @parent_node = @root
      @delete_node = @root


      def hunt_node(current_node, val)

        if current_node.value == val
          @delete_node = current_node
          return
        elsif current_node.value < val
          @parent_node = current_node
          hunt_node(current_node.right_child, val)
        elsif current_node.value > val
          @parent_node = current_node
          hunt_node(current_node.left_child, val)
        end

      end

      hunt_node(@root, delete_val)

      @delete_node_left = @delete_node.left_child
      @delete_node_right = @delete_node.right_child
      to_attach = nil

      if !@delete_node.right_child && !delete_node.left_child
        to_attach = nil
      elsif @delete_node.right_child && !@delete_node.left_child
        to_attach = @delete_node.right_child
      elsif @delete_node.left_child && !@delete_node.right_child
        to_attach = @delete_node.left_child
      elsif @delete_node.left_child && @delete_node.right_child
        to_attach = @delete_node.right_child

        @left_most_node = @delete_node.right_child

        while @left_most_node.left_child != nil
          @left_most_node = @left_most_node.left_child
        end

        @left_most_node.left_child = @delete_node.left_child
      end
 

      if @parent_node.value < @delete_node.value
          # rightchild equal to attach
          @parent_node.right_child = to_attach
      elsif @parent_node.value > @delete_node.value
          # leftchild equal to attach
          @parent_node.left_child = to_attach
      end

    end

  end

  def depth_first_traversal
    @collection = []

    def order(curr_node)
      if curr_node == nil
        return
      else
        # pre-order
        @collection << curr_node.value
        order(curr_node.left_child)
        order(curr_node.right_child)
        
        # in-order
        # order(curr_node.left_child)
        # @collection << curr_node.value
        # order(curr_node.right_child)

        # post-order
        # order(curr_node.left_child)
        # order(curr_node.right_child)
        # @collection << curr_node.value
      end
    end

    order(@root)
    @collection
  end

  def breadth_first(tree)
    position = [tree.root]
    collection = []

    while position.length != 0
      temp = position.shift
      collection.push(temp.val)
      if(temp.leftChild)
        position.push(temp.leftChild)
      end

      if(temp.rightChild)
        position.push(temp.rightChild)
      end

    end

    collection
  end
end