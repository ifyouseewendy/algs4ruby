require 'test_helper'

module Algs4ruby
  class Searching
    class BinarySearchTreeTest < MiniTest::Test
      attr_reader :bst, :data

      def setup
        @bst = Searching::BinarySearchTree.new

        @data = %w(S E A R C H E X A M P L E)
        @data.each_with_index do |key, value|
          @bst.put(key, value)
        end
      end

      def test_get
        assert_equal 0, bst.get('S')
        assert_equal 8, bst.get('A')
        assert_equal nil, bst.get('Z')
      end

      def test_put
        assert_equal 8, bst.get('A')
        bst.put('A', -1)
        assert_equal (-1), bst.get('A')

        bst.put('A', 8) # restore
      end

      def test_keys
        assert_equal data.uniq.sort, bst.keys
      end

      def test_contains?
        assert bst.contains?('A')
        refute bst.contains?('Z')
      end

      def test_min
        assert_equal 'A', bst.min
      end

      focus
      def test_max
        assert_equal 'X', bst.max
      end
    end
  end
end
