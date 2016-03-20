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
    end
  end
end
