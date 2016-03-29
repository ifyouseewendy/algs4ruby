module Algs4ruby
  class Queue
    class ResizingArray
      include Enumerable

      attr_accessor :head, :tail, :array, :size

      def initialize(capacity = 2)
        @head = @tail = 0
        @array = Array.new(capacity)
        @size = 0
      end

      def enq(item)
        resize(2*array.length) if size == array.length

        array[tail] = item
        self.tail   = next_pos_of(tail)
        self.size  += 1

        nil
      end

      def deq
        raise 'Deq on empty queue' if empty?

        resize(array.length/2) if size == array.length/4 && size.nonzero?

        item        = array[head]
        self.head   = next_pos_of(head)
        self.size  -= 1

        return item
      end

      def empty?
        size.zero?
      end

      def each
        return to_enum(:each) unless block_given?

        pos = head
        size.times do
          yield array[pos]
          pos = next_pos_of(pos)
        end
      end

      private

        def next_pos_of(num)
          (num+1) % array.length
        end

        def resize(capacity)
          # puts "--> Resized. before: #{@array.length}, after: #{capacity}"

          new_array = Array.new(capacity)
          idx       = 0

          pos   = head
          count = size

          count.times do
            new_array[idx] = array[pos]
            idx += 1
            pos = next_pos_of(pos)
          end

          self.head  = 0
          self.tail  = count
          self.array = new_array

          nil
        end

    end
  end
end
