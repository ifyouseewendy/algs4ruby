module Algs4ruby
  class Searching
    class BinarySearchTree
      attr_accessor :root

      def initialize
      end

      def put(key, value)
        self.root = recursive_put(root, key, value)
      end

      def get(key)
        recursive_get(root, key)
      end

      def contains?(key)
        get(key) != nil
      end

      def size
        root&.size || 0
      end

      def empty?
        size == 0
      end

      def min
      end

      def max
      end

      def delete_min
      end

      def delete_max
      end

      def floor(key)
      end

      def ceiling(key)
      end

      def delete(key)
      end

      def rank(key)
      end

      def select(k)
      end

      def keys
        recursive_keys(root)
      end

      class Node
        attr_accessor :key, :value, :left, :right

        def initialize(key, value)
          @key   = key
          @value = value
        end
      end

      private

        def recursive_put(node, key, value)
          return Node.new(key, value) if node.nil?

          if key < node.key
            node.left = recursive_put(node.left, key, value)
          elsif key > node.key
            node.right = recursive_put(node.right, key, value)
          else
            node.value = value
          end

          return node
        end

        def recursive_get(node, key)
          return nil if node.nil?

          if key < node.key
            recursive_get(node.left, key)
          elsif key > node.key
            recursive_get(node.right, key)
          else
            return node.value
          end
        end

        def recursive_keys(node)
          return [] if node.nil?
          recursive_keys(node.left) + [node.key] + recursive_keys(node.right)
        end


    end
  end
end
