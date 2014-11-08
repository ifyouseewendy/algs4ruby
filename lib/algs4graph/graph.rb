class Graph
  attr_reader :vertex, :adj

  class << self
    def initialize_from(io)
      vertex = io.readline.strip.to_i
      graph = self.new(vertex)

      while !io.eof?
        v, w = io.readline.strip.split.map(&:to_i)
        graph.add_edge(v, w)
      end

      graph
    end

    def test
      sio = StringIO.new("5\n0 1\n0 2\n3 4\n2 0")
      g = self.initialize_from(sio)
      puts g
    end
  end

  def initialize(vertex)
    @vertex = vertex
    @adj = Array.new(vertex){|i| Array.new}
  end

  def add_edge(v, w)
    @adj[v].push(w) unless @adj[v].include? w
    @adj[w].push(v) unless @adj[w].include? v
  end

  def to_s
    puts "--> Graph, vertex: #{@vertex}"
    (0...@vertex).each{|v| @adj[v].each{|w| puts "#{v} -- #{w}"} }
    nil
  end

end

