module Algs4ruby
  class UnionFind
    class QuickUnion < Base
      ##
      # O(N^2), to process N union commands on N objects.
      #
      # initialize union find
      #         N     N     N

      def union(p, q)
        ids[p] = root(q)
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

        def to_s
          [
            (0...ids.count).to_a.join(' '),
            ids.join(' ')
          ].join("\n")
        end
    end
  end
end
