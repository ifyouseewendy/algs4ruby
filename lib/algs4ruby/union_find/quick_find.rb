module Algs4ruby
  module UnionFind
    class QuickFind < Base
      ##
      # O(N^2), to process N union commands on N objects.
      #
      # initialize union find
      #         N     N     1

      def union(p, q)
        pid, qid = @id[p], @id[q]
        @id.each_index do |i|
          @id[i] = qid if @id[i] == pid
        end
      end

      def connected?(p, q)
        @id[p] == @id[q]
      end
    end
  end
end
