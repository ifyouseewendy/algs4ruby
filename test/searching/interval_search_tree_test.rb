require 'test_helper'

module Algs4ruby
  class Searching
    class IntervalSearchTreeTest < MiniTest::Test
      attr_reader :bst

      def setup
        @bst = Searching::IntervalSearchTree.new

        raw = [
          [4,  8,  1],
          [5,  8,  2],
          [7,  10, 3],
          [15, 18, 4],
          [17, 19, 5],
          [21, 24, 6]
        ]

        raw.each do |ar|
          @bst.put(*ar)
        end

      end

      def test_get
        assert_equal 1,   bst.get(4, 8)
        assert_equal 3,   bst.get(7, 10)
        assert_equal nil, bst.get(7, 0)
      end

      def test_delete
        assert_equal 3,   bst.get(7, 10)
        assert_equal 10,  bst.root.left.value.max_endpoint

        bst.delete(7, 10)

        assert_equal nil, bst.get(7, 10)
        assert_equal 8,  bst.root.left.value.max_endpoint
      end

      def test_intersects
        assert_equal [21, 24], bst.intersects(21, 23)
        assert_equal [15, 18], bst.intersects(1, 23)
      end
    end
  end
end

# -----------------------
#
#             (15,18)
#           /         \
#       (5,8)         (21,24)
#       /   \         /
#  (4,8)   (7,10)   (17, 19)
