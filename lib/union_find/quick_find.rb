class QuickFind
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

      quick_find = self.new(io.readline.strip.to_i)
      while !io.eof?
        p, q = io.readline.strip.split.map(&:to_i)
        quick_find.union(p, q)
      end

      puts quick_find
      puts "0 is connected to 7 ? #{quick_find.connected?(0, 7)}"
      puts "1 is connected to 8 ? #{quick_find.connected?(1, 8)}"
      puts "3 is connected to 4 ? #{quick_find.connected?(3, 4)}"
    end
  end

  def initialize(n)
    @id = Array.new(n){|i| i}
  end

  def union(p, q)
    pid, qid = @id[p], @id[q]
    @id.each_index do |i|
      @id[i] = qid if @id[i] == pid
    end
  end

  def connected?(p, q)
    @id[p] == @id[q]
  end

  private

    def to_s
      [
        (0...@id.count).to_a.join(' '),
        @id.join(' ')
      ].join("\n")
    end
end
