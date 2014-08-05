# this class realise Deixtra algorithm to find shortest way
class Deixtra

  # this class store vertex params
  class Vertex
    attr_reader :id, :connections
    attr_accessor :cost

    def initialize city
      @id = city.id
      @cost = 10**6
      @connections = city.roads
    end

    def cost_to id
      # returns connection cost from this vertex to vertex with id == id
      @connections[id].nil? ? id == self.id ? 0 : false : @connections[id]
    end

  end

  attr_reader :vertexes, :visited
  def initialize
    @vertexes = [] # all vertexes
    @visited = [] # visited vertexes
  end

  def add_vertex vertex
    @vertexes << vertex
  end

  def find id
    @vertexes.find{|v| v.id == id}
  end

  def process from, to
    # this method finds ways from one vertex to all others
    from = find from
    to = find to

    # simple Deixtra algorithm.
    # cost of sourse = 0
    # then we take not "visited" vertex (V) with minimal cost and find cost to all connected vertexes by addition cost of (V) and
    # cost of way to its neighbours. If calculated way is shorter, then neighbour cost, neighbour cost = calculated way.
    # when all neighbouta are checked, it becomes "visited".
    from.cost = 0
    while @vertexes.count > 0
      vertex = @vertexes.min{|a,b| a.cost <=> b.cost}
      vertex.connections.each do |to, cost|
        distemnation = find(to)
        if distemnation
          if vertex.cost + cost < distemnation.cost
            distemnation.cost = vertex.cost + cost
          end
        end
      end

      @visited << vertex
      @vertexes.delete_if{|v| v.id == vertex.id}
    end

    to.cost
  end

  def reset
    @vertexes = @visited
    @visited = []

    @vertexes.each do |v|
      v.cost = 10**6
    end
  end
end
