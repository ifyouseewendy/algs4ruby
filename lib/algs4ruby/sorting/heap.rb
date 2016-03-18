module Algs4ruby
  class Sorting
    class Heap < Base
      # = O(NlgN)
      #
      # = In place
      # = Not stable
      def sort(array, &block)
        pq = PriorityQueue.new(array, &block)

        result = []
        result << pq.delete_max until pq.empty?

        result.reverse
      end
    end
  end
end

