require_relative 'graph'

class DepthFirstPaths
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
      dfp = self.new(graph, 0)

      puts "--> has path to #{3} ?: #{dfp.has_path_to?(3)}"
      puts "--> paths: #{dfp.path_to(3)}"

      puts "--> has path to #{6} ?: #{dfp.has_path_to?(6)}"
      puts "--> paths: #{dfp.path_to(6)}"
    end
  end

  def initialize(graph, source)
    @source = source
    @marked = Array.new(graph.vertex, false)
    @edge_to = Array.new(graph.vertex){|v| v}

    dfs(graph, source)
  end

  def dfs(graph, v)
    @marked[v] = true

    graph.adj[v].each do |w|
      unless @marked[w]
        dfs(graph, w)
        @edge_to[w] = v
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
end
