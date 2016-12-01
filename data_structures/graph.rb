class Vertex
  attr_accessor :value, :edges
  def initialize(val)
    @value = val
    @edges = {}
  end

end

class Graph

  attr_accessor :vertices, :total_vertices, :total_edges

  def initialize
    @vertices = {}
    @total_vertices = 0
    @total_edges = 0
  end

  def add_vertex(id)
    if @vertices[id]
      return 'vertex already exists'
    else
      new_vertex = Vertex.new(id)
      @vertices[id] = new_vertex
      @total_vertices += 1
    end
  end

  def get_vertex(id)
    if @vertices[id]
      return @vertices[id]
    else
      return 'vertex does not exist'
    end
  end

  def remove_vertex(id)
    if @vertices[id]
      @vertices.delete(id)
      @total_vertices -= 1
    else
      return 'vertex does not exist'
    end
  end

  def add_edge(id1, id2)
    if @vertices[id1] && @vertices[id2]
      if @vertices[id1].edges[id2] && @vertices[id2].edges[id1]
        return 'edge already exists'
      else
        @vertices[id1].edges[id2] = true
        @vertices[id2].edges[id1] = true
        @total_edges += 1
      end
    else
      return 'vertex does not exist'
    end
  end

  def breadth_first(id)
    @queue = [id]
    @collection = {}


    while !@queue.empty?
      current_v = @queue.shift
      if @vertices[current_v]
        @vertices[current_v].edges.each do |key, value|
          if !@collection[key]
            @queue << key
          end
        end
      end
      @collection[current_v] = true
    end

    @collection.keys
  end

  def depth_first(id)
    @collection = {}

    def traverse(id)
      if !@vertices[id]
        return
      elsif @collection[id]
        return
      end

      @collection[id] = true
      @vertices[id].edges.each do |key, value|
        traverse(key)
      end
          
    end

    traverse(id)
    @collection.keys
  end

end