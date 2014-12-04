class QuickFind
  ##
  # O(N^2), to process N union commands on N objects.
  #
  # initialize union find
  #         N     N     1

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
