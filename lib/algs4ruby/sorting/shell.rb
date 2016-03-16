module Algs4ruby
  class Sorting
    class Shell < Base
      # = O(N^1.5)
      #
      #   Using Knuth's Increment Sequence, 3N+1
      #
      # = Not stable

      def sort(array, &block)
        arr = array.clone
        n   = arr.length

        base = 1
        strides = 5.times.reduce([]){|ret, _| ret << base; base = base*3 + 1; ret}.reverse

        strides.each do |stride|
          0.upto(n-2) do |i|
            next if i + 1 < stride

            (i+1).step(0, 0-stride) do |j|
              next if j < stride
              exch(arr, j, j-stride) if less(arr[j], arr[j-stride], &block)
            end
          end
        end

        arr
      end
    end
  end
end
