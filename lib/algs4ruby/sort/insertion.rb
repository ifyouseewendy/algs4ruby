module Sorting
  class Insertion < Base
    class << self
      def sort(array, &block)
        arr = array.clone
        n   = arr.length

        0.upto(n-2) do |i|
          (i+1).downto(1) do |j|
            exch(arr, j, j-1) if less(arr[j], arr[j-1], &block)
          end
        end

        arr
      end
    end
  end
end
