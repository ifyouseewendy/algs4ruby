module Algs4ruby
  class Searching
    class RedBlackBST < BinarySearchTree
      RED   = :red
      BLACK = :black

      class Node
        attr_accessor :key, :value, :left, :right, :size, :color

        def initialize(key, value, color)
          @key   = key
          @value = value
          @color = color
        end
      end

      private

        def is_red?(node)
          node&.color == RED
        end

        def rotate_left(node)
          x          = node.right
          node.right = x.left
          x.left     = node
          x.color    = node.color
          node.color = RED

          return x
        end

        def rotate_right(node)
          x          = node.left
          node.left  = x.right
          x.right    = node
          x.color    = node.color
          node.color = RED

          return x
        end

        def flip_colors(node)
          node.color       = RED
          node.left.color  = BLACK
          node.right.color = BLACK
        end

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

          return node
        end

    end
  end
end
