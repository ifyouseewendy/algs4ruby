require 'test_helper'

module Algs4ruby
  class Searching
    class BinarySearchTreeTest < MiniTest::Test
      include BSTTestHelper

      def setup
        @bst = Searching::BinarySearchTree.new
        super
      end

      def test_traverse
        assert_equal bst.keys, bst.traverse
        assert_equal ['S', 'E', 'A', 'C', 'R', 'H', 'M', 'L', 'P', 'X'], bst.traverse(order: :preorder)
        assert_equal ['C', 'A', 'L', 'P', 'M', 'H', 'R', 'E', 'X', 'S'], bst.traverse(order: :postorder)
      end
    end
  end
end


# -----------------------
#
#              S
#           /     \
#         E         X
#       /   \
#     A       R
#      \    /
#       C H
#           \
#             M
#           /   \
#         L       P
