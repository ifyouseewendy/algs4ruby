module Algs4ruby
  class Searching
    class IntervalSearchTree < RedBlackBST
      # Precondition
      #
      #  No two intervals have the same left endpoint.

      Value = Struct.new(:hi, :max_endpoint, :value)

      def put(lo, hi, value)
        key       = lo # Use left endpoint as BST key.
        value     = Value.new(hi, hi, value) # Store hi and max_endpoint into Value object
        self.root = recursive_put(root, key, value)
      end

      def get(lo, hi)
        value = recursive_get(root, lo)
        return nil unless value&.hi == hi
        value.value
      end

      def delete(lo, hi)
        recursive_delete(root, lo)
      end

      def intersects(lo, hi)
        recursive_intersects(root, lo, hi)
      end

      private

        def recursive_put(node, key, value)
          return Node.new(key, value, RED) if node.nil?

          if key < node.key
            node.left = recursive_put(node.left, key, value)
          elsif key > node.key
            node.right = recursive_put(node.right, key, value)
          else
            node.value = value
          end

          node = rotate_left(node)  if is_red?(node.right) && !is_red?(node.left)
          node = rotate_right(node) if is_red?(node.left)  && is_red?(node.left.left)
          flip_colors(node)         if is_red?(node.left)  && is_red?(node.right)

          node.size = size_of(node)
          update_max_end_point!(node)

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
          update_max_end_point!(node)

          return node
        end

        def update_max_end_point!(node)
          # Store max endpoint in subtree rooted at node.
          node.value.max_endpoint = [node.left, node.right].reject(&:nil?).map{|nd| nd.value.max_endpoint}.max
        end

        def recursive_intersects(node, lo, hi)
          return nil if node.nil?

          if intersected?(node, lo, hi)
            return [node.key, node.value.hi]
          elsif node.left.nil?
            recursive_intersects(node.right, lo, hi)
          elsif node.left.value.max_endpoint < lo
            recursive_intersects(node.right, lo, hi)
          else
            recursive_intersects(node.left, lo, hi)
          end
        end

        def intersected?(node, lo, hi)
          return false if node.nil?
          node_lo = node.key
          node_hi = node.value.hi

          return false if hi < node_lo || lo > node_hi

          true
        end
    end
  end
end
