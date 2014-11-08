require_relative 'graph'

class BreadthFirstPaths
  class << self
    def test
      sio = StringIO.new \
              [
                '7',
                '0 1',
                '0 2',
                '0 5',
                '1 2',
                '2 3',
                '2 4',
                '3 4',
                '3 5'
              ].join("\n")

      graph = Graph.initialize_from(sio)
      source = 0
      bfp = self.new(graph, source)

      puts "--> has path to #{3} ?: #{bfp.has_path_to?(3)}"
      puts "--> shorted path length: #{bfp.length_to(3)}"
      puts "--> paths: #{bfp.path_to(3)}"

      puts "--> has path to #{6} ?: #{bfp.has_path_to?(6)}"
      puts "--> shorted path length: #{bfp.length_to(6)}"
      puts "--> paths: #{bfp.path_to(6)}"
    end
  end

  def initialize(graph, source)
    @source = source
    @marked = Array.new(graph.vertex, false)
    @edge_to = Array.new(graph.vertex){|v| v}
    @length = Array.new(graph.vertex, 0)

    bfs(graph, source)
  end

  def bfs(graph, s)
    queue = []
    queue.push s
    @marked[s] = true

    while !queue.empty?
      v = queue.pop
      graph.adj[v].each do |w|
        unless @marked[w]
          queue.push w
          @marked[w] = true
          @edge_to[w] = v
          @length[w] += @length[v] + 1
        end
      end
    end
  end

  def has_path_to?(v)
    @marked[v]
  end

  def path_to(v)
    return unless @marked[v]

    paths = []
    while( v != @source )
      paths.unshift(v)
      v = @edge_to[v]
    end
    paths.unshift @source

    paths.join(', ')
  end

  def length_to(v)
    @length[v]
  end
end
