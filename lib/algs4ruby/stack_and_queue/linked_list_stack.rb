module Algs4ruby
  class Stack
    class LinkedList
      include Enumerable

      Node = Struct.new(:item, :next)

      attr_accessor :first, :size

      def initialize
        @size = 0
      end

      def push(item)
        node        = Node.new(item, first)
        self.first  = node
        self.size  += 1
        nil
      end

      def pop
        raise 'Pop on empty stack' unless first

        item        = first.item
        self.first  = first.next
        self.size  -= 1

        item
      end

      def empty?
        first.nil?
      end

      def each
        return to_enum(:each) unless block_given?

        pointer = first
        size.times do
          yield pointer.item
          pointer = pointer.next
        end
      end

    end
  end
end
