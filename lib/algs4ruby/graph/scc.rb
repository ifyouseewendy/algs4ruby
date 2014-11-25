require_relative 'topological_order'

class SCC
  attr_reader :count

  class << self
    def test
      sio = StringIO.new \
              [
                '7',
                '0 1',
                '1 2',
                '2 0',
                '2 3',
                '3 2',
                '3 4',
                '4 5',
              ].join("\n")

      graph = Digraph.initialize_from(sio)
      scc = self.new(graph)

      puts "--> Connected Components count: #{scc.count}"
      puts "--> 1 is connected to 2 ? #{scc.strong_connected?(1, 2)}"
      puts "--> 0 is connected to 3 ? #{scc.strong_connected?(0, 3)}"
      puts "--> 0 is connected to 6 ? #{scc.strong_connected?(0, 6)}"
    end
  end

  def initialize(graph)
    @marked = Array.new(graph.vertex, false)
    @id = Array.new(graph.vertex){|v| v}
    @count = 0

    topo_order = TopologicalOrder.new(graph.reverse).reverse_post

    topo_order.each do |v|
      next if @marked[v]

      dfs(graph, v)
      @count += 1
    end
  end

  def strong_connected?(v, w)
    @id[v] == @id[w]
  end

  private

    def dfs(graph, v)
      @marked[v] = true
      @id[v] = @count

      graph.adj[v].each do |w|
        unless @marked[w]
          dfs(graph, w)
        end
      end
    end

end
