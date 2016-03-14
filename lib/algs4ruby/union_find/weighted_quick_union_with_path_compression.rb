module Algs4ruby
  class UnionFind
    class WeightedQuickUnionWithPathCompression < Base
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
        super(n)
        @weight   = Array.new(n, 0)
        @strategy = strategy
      end

      def union(p, q)
        rp, rq = root(p), root(q)
        return if rp == rq
        if @weight[rp] < @weight[rq]
          ids[rp] = rq
          update_weight(rq, rp)
        else
          ids[rq] = rp
          update_weight(rp, rq)
        end

        nil
      end

      def connected?(p, q)
        root(p) == root(q)
      end

      private

        def root(i)
          while i != ids[i]
            ids[i] = ids[ ids[i] ] # Path Compression
            i = ids[i]
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
            (0...ids.count).to_a.join(' '),
            ids.join(' ')
          ].join("\n")
        end
    end
  end
end
