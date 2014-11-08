require_relative 'graph'

class CC
  attr_reader :count

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
      cc = self.new(graph)

      puts "--> Connected Components count: #{cc.count}"
      puts "--> 1 is connected to 2 ? #{cc.connected?(1, 2)}"
      puts "--> 0 is connected to 3 ? #{cc.connected?(0, 3)}"
      puts "--> 0 is connected to 6 ? #{cc.connected?(0, 6)}"
    end
  end

  def initialize(graph)
    @marked = Array.new(graph.vertex, false)
    @id = Array.new(graph.vertex){|v| v}
    @count = 0

    (0...graph.vertex).each do |v|
      next if @marked[v]

      dfs(graph, v)
      @count += 1
    end
  end

  def connected?(v, w)
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
