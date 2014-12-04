module Algs4ruby
  module UnionFind
    class QuickUnion < Base
      ##
      # O(N^2), to process N union commands on N objects.
      #
      # initialize union find
      #         N     N     N

      def union(p, q)
        @id[p] = root(q)
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
  end
end
