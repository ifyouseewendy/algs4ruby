module Algs4ruby
  class Sorting
    class Shuffling < Base
      # = O(N)
      #
      #   by Knuth Shuffle
      #
      # = O(NlgN)
      #
      #   by Sort Shuffle

      def sort(array, &block)
        arr = array.clone
        n   = arr.length

        (0..n-1).each do |i|
          r = rand(i+1)
          exch(arr, i, r)
        end

        arr
      end
    end

  end
end
