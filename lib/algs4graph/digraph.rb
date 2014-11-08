class Digraph
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
  end

  private

    def to_s
      puts "--> Graph, vertex: #{@vertex}"
      (0...@vertex).each{|v| @adj[v].each{|w| puts "#{v} -- #{w}"} }
      nil
    end

end

