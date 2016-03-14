module Algs4ruby
  class UnionFind
    class QuickFind < Base
      ##
      # O(N^2), to process N union commands on N objects.
      #
      # initialize union find
      #         N     N     1

      def union(p, q)
        pid, qid = ids[p], ids[q]
        ids.each_index do |i|
          ids[i] = qid if ids[i] == pid
        end
      end

      def connected?(p, q)
        ids[p] == ids[q]
      end
    end
  end
end
