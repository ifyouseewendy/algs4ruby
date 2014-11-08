require_relative 'digraph'

class TopologicalOrder
  attr_reader :reverse_post

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

      graph = Digraph.initialize_from(sio)
      to = self.new(graph)

      puts "--> Topological order#{"(cyclic)" if to.has_cycle?}: #{to} "

      sio = StringIO.new \
              [
                '3',
                '0 1',
                '1 2',
                '2 0'
              ].join("\n")

      graph = Digraph.initialize_from(sio)
      to = self.new(graph)

      puts "--> Topological order#{"(cyclic)" if to.has_cycle?}: #{to} "
    end
  end

  def initialize(graph)
    @marked = Array.new(graph.vertex, false)
    @reverse_post = []
    # record in which dfs
    @visited = Array.new(graph.vertex){|v| [v]}
    @cyclic = false

    (0...graph.vertex).each do |v|
      next if @marked[v]

      dfs(graph, v)
    end
  end

  def dfs(graph, v)
    @marked[v] = true

    graph.adj[v].each do |w|
      if @marked[w]
        @cyclic = true if @visited[v].include? w
      else
        @visited[w] += @visited[v]
        dfs(graph, w)
      end
    end

    # Everytime we checked v, we can gurantee that no vertex
    # from v will be checked. So we push v onto the stack.
    @reverse_post.unshift v
  end

  def has_cycle?
    @cyclic
  end

  private

    def to_s
      @reverse_post.join(', ')
    end
end
