module Algs4ruby
  class Queue
    class LinkedList
      Node = Struct.new(:item, :next)

      attr_accessor :first, :last, :size

      def initialize
        @size = 0
      end

      def enq(item)
        old_last  = last
        self.last = Node.new(item, nil)

        if empty?
          self.first = last
        else
          old_last.next = last
        end

        self.size += 1

        nil
      end

      def deq
        raise 'Deq on empty queue' if empty?

        item        = first.item
        self.first  = first.next
        self.last   = nil if empty?
        self.size  -= 1

        return item
      end

      def empty?
        first == nil
      end

    end
  end
end
