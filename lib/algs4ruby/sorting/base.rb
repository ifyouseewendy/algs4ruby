module Algs4ruby
  class Sorting
    class Base
      def sort(array, &block)
        raise 'Not Implemented'
      end

      def sort!(array, &block)
        result = sort(array, &block)
        array.clear
        result.each{|ele| array << ele}

        nil
      end

      private

        def less(a, b)
          if block_given?
            yield(a,b)
          else
            a < b
          end
        end

        def exch(arr, i, j)
          t       = arr[i]
          arr[i]  = arr[j]
          arr[j]  = t
        end
    end
  end
end
