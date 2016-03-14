module Algs4ruby
  class UnionFind
    class WeightedQuickUnion < Base
      ##
      # O(NlgN), to process N union commands on N objects.
      #
      # initialize union find
      #         N    lgN  lgN
      #
      # Link root of smaller tree to root of larger tree.
      #
      # Weighted by
      # + size
      # + height
      # + rank

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
      end

      def connected?(p, q)
        root(p) == root(q)
      end

      private

        def root(i)
          while i != ids[i]
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
