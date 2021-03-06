module Algs4ruby
  class Searching
    class BinarySearchTree
      attr_accessor :root

      class Node
        attr_accessor :key, :value, :left, :right, :size

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
        recursive_min(root)
      end

      def max
        recursive_max(root)
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
        self.root = recursive_delete_min(root)
      end

      def delete_max
        self.root = recursive_delete_max(root)
      end

      def delete(key)
        self.root = recursive_delete(root, key)
      end

      def size_in_range(lo, hi)
        sum = rank(hi) - rank(lo)
        sum += 1 if contains?(hi)

        sum
      end

      def keys_in_range(lo, hi)
        recursive_keys_in_range(root, lo, hi)
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

        def recursive_min(node)
          return node if node.left.nil?
          recursive_min(node.left)
        end

        def recursive_max(node)
          return node if node.right.nil?
          recursive_max(node.right)
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
            recursive_select(node.right, k-left_size-1)
          else
            node.key
          end
        end

        def recursive_delete_min(node)
          return node.right if node.left.nil?

          node.left = recursive_delete_min(node.left)
          node.size = size_of(node.left) + 1 + size_of(node.right)

          return node
        end

        def recursive_delete_max(node)
          return node.left if node.right.nil?

          node.right = recursive_delete_max(node.right)
          node.size = size_of(node.left) + 1 + size_of(node.right)

          return node
        end

        # Hibbard deletion
        def recursive_delete(node, key)
          return nil if node.nil?

          if key < node.key
            node.left = recursive_delete(node.left, key)
          elsif key > node.key
            node.right = recursive_delete(node.right, key)
          else
            return node.right if node.left.nil?
            return node.left  if node.right.nil?

            successor       = recursive_min(node.right)
            successor.right = recursive_delete_min(node.right)
            successor.left  = node.left

            node = successor
          end

          node.size = size_of(node.left) + 1 + size_of(node.right)
          return node
        end

        def recursive_keys_in_range(node, lo, hi)
          return [] if node.nil?

          if node.key < lo
            recursive_keys_in_range(node.right, lo, hi)
          elsif node.key >= lo && node.key <= hi
            recursive_keys_in_range(node.left, lo, hi) + [node.key] + recursive_keys_in_range(node.right, lo, hi)
          elsif node.key > hi
            recursive_keys_in_range(node.left, lo, hi)
          end
        end

    end
  end
end
