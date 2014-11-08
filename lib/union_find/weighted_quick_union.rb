class WeightedQuickUnion
  class << self
    def test
      io = StringIO.new\
              [
                '10',
                '4 3',
                '3 8',
                '6 5',
                '9 4',
                '2 1',
                '8 9',
                '5 0',
                '7 2',
                '6 1',
                '1 0',
                '6 7'
              ].join("\n")

      weighted_quick_union = self.new(io.readline.strip.to_i)
      while !io.eof?
        p, q = io.readline.strip.split.map(&:to_i)
        weighted_quick_union.union(p, q)
      end

      puts weighted_quick_union
      puts "0 is connected to 7 ? #{weighted_quick_union.connected?(0, 7)}"
      puts "1 is connected to 8 ? #{weighted_quick_union.connected?(1, 8)}"
      puts "3 is connected to 4 ? #{weighted_quick_union.connected?(3, 4)}"
    end
  end

  def initialize(n)
    @id = Array.new(n){|i| i}
    @size = Array.new(n, 0)
  end

  # Weighted Union by size
  def union(p, q)
    rp, rq = root(p), root(q)
    return if rp == rq
    if @size[rp] < @size[rq]
      @id[rp] = rq
      @size[rq] += @size[rp]
    else
      @id[rq] = rp
      @size[rp] += @size[rq]
    end
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  private

    def root(i)
      while i != @id[i]
        i = @id[i]
      end
      i
    end

    def to_s
      [
        (0...@id.count).to_a.join(' '),
        @id.join(' ')
      ].join("\n")
    end
end
