module Algs4ruby
  class Searching
    class BinarySearchTree
      attr_accessor :root

      class Node
        attr_accessor :key, :value, :left, :right

        def initialize(key, value)
          @key   = key
          @value = value
        end
      end

      def put(key, value)
        self.root = recursive_put(root, key, value)
      end

      def get(key)
        recursive_get(root, key)
      end

      def delete(key)
      end

      def keys
        recursive_keys(root)
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
        node = root

        loop do
          return node.key if node.left.nil?
          node = node.left
        end
      end

      def max
        node = root

        loop do
          return node.key if node.right.nil?
          node = node.right
        end
      end

      def floor(key)
        recursive_floor(root, key)
      end

      def ceiling(key)
        recursive_ceiling(root, key)
      end

      def delete_min
      end

      def delete_max
      end

      def delete(key)
      end

      def rank(key)
      end

      def select(k)
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

        def recursive_floor(node, key)
          return if node.nil?

          if key == node.key
            return key
          elsif key < node.key
            recursive_floor(node.left, key)
          elsif key > node.key
            recursive_floor(node.right, key) || node.key
          end
        end

        def recursive_ceiling(node, key)
          return if node.nil?

          if key == node.key
            return key
          elsif key < node.key
            recursive_ceiling(node.left, key) || node.key
          elsif key > node.key
            recursive_ceiling(node.right, key)
          end
        end
    end
  end
end
