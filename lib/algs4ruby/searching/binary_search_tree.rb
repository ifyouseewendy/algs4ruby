module Algs4ruby
  class Searching
    class BinarySearchTree
      attr_accessor :root

      class Node
        attr_accessor :key, :value, :left, :right, :size

        def initialize(key, value)
          @key   = key
          @value = value
          @size = 1
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
        traverse
      end

      def traverse(order: :inorder)
        recursive_traverse(root, order)
      end

      def contains?(key)
        get(key) != nil
      end

      def size
        size_of(root)
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

      # How many keys < key?
      def rank(key)
        recursive_rank(root, key)
      end

      def select(k)
        recursive_select(root, k)
      end

      def delete_min
      end

      def delete_max
      end

      def delete(key)
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

          node.size = size_of(node)

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

        def recursive_traverse(node, order)
          return [] if node.nil?

          case order
          when :inorder
            recursive_traverse(node.left, order) + [node.key] + recursive_traverse(node.right, order)
          when :preorder
            [node.key] + recursive_traverse(node.left, order) + recursive_traverse(node.right, order)
          when :postorder
            recursive_traverse(node.left, order) + recursive_traverse(node.right, order) + [node.key]
          end
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

        def size_of(node)
          return 0 if node.nil?

          size_of(node.left) + 1 + size_of(node.right)
        end

        def recursive_rank(node, key)
          return 0 if node.nil?

          if key < node.key
            recursive_rank(node.left, key)
          elsif key > node.key
            size_of(node.left) + 1 + recursive_rank(node.right, key)
          else
            size_of(node.left)
          end
        end

        def recursive_select(node, k)
          left_size = size_of(node.left)
          if left_size > k
            recursive_select(node.left, k)
          elsif left_size < k
            recursive_select(node, k-left_size-1)
          else
            node.key
          end
        end
    end
  end
end
