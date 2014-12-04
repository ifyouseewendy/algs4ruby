class WeightedQuickUnionWithPathCompression
  ##
  # O(NlgN), to process N union commands on N objects.
  #
  # initialize union find
  #         N   lg*N lg*N (lg*65536 = 4, almost linear)
  #
  # + Weighted. Link root of smaller tree to root of larger tree.
  #   - size
  #   - height
  #   - rank
  # + Path Compression. After computing the root of p,
  #   set the id of each examined node to point to that root.

  def initialize(n, strategy = :size)
    @id       = Array.new(n){|i| i}
    @weight   = Array.new(n, 0)
    @strategy = strategy
  end

  def union(p, q)
    rp, rq = root(p), root(q)
    return if rp == rq
    if @weight[rp] < @weight[rq]
      @id[rp] = rq
      update_weight(rq, rp)
    else
      @id[rq] = rp
      update_weight(rp, rq)
    end
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  private

    def root(i)
      while i != @id[i]
        @id[i] = @id[ @id[i] ] # Path Compression
        i = @id[i]
      end
      i
    end

    def update_weight(p, q)
      case @strategy
      when :size
        @weight[p] += @weight[q]
      when :height
        @weight[p] += 1 if @weight[p] == @weight[q]
      else
        raise NotImplementedError, @strategy
      end
    end

    def to_s
      [
        (0...@id.count).to_a.join(' '),
        @id.join(' ')
      ].join("\n")
    end
end
