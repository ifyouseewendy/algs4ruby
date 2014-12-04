module Sorting
  class Selection < Base
    class << self
      # O(N^2)
      # Not stable

      def sort(array, &block)
        arr = array.clone
        n   = arr.length

        0.upto(n-2) do |i|
          min = i
          (i+1).upto(n-1) do |j|
            min = j if less(arr[j], arr[min], &block)
          end
          exch(arr, i, min) unless i == min
        end
        arr
      end
    end
  end
end
