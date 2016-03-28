module Algs4ruby
  class Stack
    class ResizingArray
      attr_accessor :size, :array

      def initialize(capacity = 2)
        @size = 0
        @array = Array.new(capacity)
      end

      def push(item)
        resize(2*array.length) if size == array.length

        array[size] = item
        self.size += 1

        nil
      end

      def pop
        raise 'Pop on empty stack' if empty?

        resize(array.length/2) if size == array.length/4

        self.size -= 1
        item = array[size]

        return item
      end

      def empty?
        size.zero?
      end

      private

        def resize(capacity)
          # puts "--> Resized. before: #{array.count}, after: #{capacity}"
          self.array = Array.new(capacity){|i| array[i]}
        end

    end
  end
end
