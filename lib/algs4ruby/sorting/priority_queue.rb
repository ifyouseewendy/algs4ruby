module Algs4ruby
  module Sorting
    class PriorityQueue
      # Heap-base version
      def initialize(array = [], &block)
        @num   = array.size

        @array = array
        @array.unshift(nil)

        @block = block || ->(a,b){ a < b }

        (@num/2).downto(1).each{|i| sink(i) }
      end

      def insert(item)
        @num += 1
        @array[@num] = item
        swim(@num)
      end

      def delete_max
        max = @array[1]

        exch(1, @num)
        @num -= 1
        sink(1)

        return max
      end

      def size
        @num
      end

      def empty?
        @num == 0
      end

      private

        def swim(k)
          while k > 1 && less(k/2, k)
            exch(k, k/2)
            k = k/2
          end
          nil
        end

        def sink(k)
          while 2*k <= @num
            j = 2*k
            j += 1 if j < @num && less(j, j+1)

            break if !less(k, j)

            exch(k, j)
            k = j
          end
          nil
        end

        def less(a, b)
          @block.call(@array[a],@array[b])
        end

        def exch(i, j)
          t         = @array[i]
          @array[i] = @array[j]
          @array[j] = t
        end

        def to_s
          puts (1..@num).to_a.join("\t")
          puts @array[1, @num].join("\t")
        end

    end
  end
end
