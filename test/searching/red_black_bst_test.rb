require 'test_helper'

module Algs4ruby
  class Searching
    class RedBlackBSTTest < MiniTest::Test
      include BSTTestHelper

      def setup
        @bst = Searching::RedBlackBST.new
        super
      end

      def test_traverse
        assert_equal bst.keys, bst.traverse
        assert_equal ['M', 'E', 'C', 'A', 'L', 'H', 'R', 'P', 'X', 'S'], bst.traverse(order: :preorder)
        assert_equal ['A', 'C', 'H', 'L', 'E', 'P', 'S', 'X', 'R', 'M'], bst.traverse(order: :postorder)
      end

      def test_size_in_range
        assert_equal 3, bst.size_in_range('A', 'F')
        assert_equal 7, bst.size_in_range('E', 'S')
      end

      def test_keys_in_range
        assert_equal ['A', 'C', 'E'], bst.keys_in_range('A', 'F')
        assert_equal ['E', 'H', 'L', 'M', 'P', 'R', 'S'], bst.keys_in_range('E', 'S')
      end
    end
  end
end

# -----------------------
#
#              M
#           /     \
#         E         R
#       /   \     /   \
# A - C   H - L  P  S - X
