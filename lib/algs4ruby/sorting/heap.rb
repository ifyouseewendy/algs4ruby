module Algs4ruby
  module Sorting

    class Heap < Base
      class << self
        # = O(NlgN)
        #
        # = Not stable
        def sort(array, &block)
          @num   = array.size

          @array = array
          @array.unshift(nil)

          @block = block || ->(a,b){ a < b }

          construct and sortdown
        end

        def construct
          (@num/2).downto(1).each{|i| sink(i) }
        end

        def sortdown
          while @num > 1
            exch(@array, 1, @num)
            @num -= 1

            sink(1)
          end
          @array.shift

          return @array
        end

        def swim(k)
          while k > 1 && less(@array[k/2], @array[k], &@block)
            exch(@array, k, k/2)
            k = k/2
          end
          nil
        end

        def sink(k)
          while 2*k <= @num
            j = 2*k
            j += 1 if j < @num && less(@array[j], @array[j+1], &@block)

            break if !less(@array[k], @array[j], &@block)

            exch(@array, k, j)
            k = j
          end
          nil
        end

      end
    end
  end
end

