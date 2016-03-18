module Algs4ruby
  class Sorting
    class PriorityQueue
      # Binary Heap implementation

      attr_accessor :num, :array, :block

      def initialize(arr = [], &block)
        @array = arr.clone
        @num   = array.size
        @array.unshift(nil)

        @block = block || ->(a,b){ a < b }

        construct
      end

      def insert(item)
        self.num += 1
        array[num] = item
        swim(num)
      end

      def delete_max
        max = array[1]

        exch(1, num)
        self.num -= 1
        sink(1)

        return max
      end

      def size
        num
      end

      def empty?
        num == 0
      end

      private

        def construct
          (num/2).downto(1).each{|i| sink(i) }
        end

        def swim(k)
          while k > 1 && less(k/2, k)
            exch(k, k/2)
            k = k/2
          end
          nil
        end

        def sink(k)
          while 2*k <= num
            j = 2*k
            j += 1 if j < num && less(j, j+1)

            break if !less(k, j)

            exch(k, j)
            k = j
          end
          nil
        end

        def less(a, b)
          block.call(array[a], array[b])
        end

        def exch(i, j)
          t         = array[i]
          array[i] = array[j]
          array[j] = t
        end

        def to_s
          puts (1..num).to_a.join("\t")
          puts array[1, num].join("\t")
        end

    end
  end
end
