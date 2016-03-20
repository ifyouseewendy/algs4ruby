require 'test_helper'

module Algs4ruby
  class Searching
    module BSTTestHelper
      def self.included(base)
        base.class_eval do
          attr_reader :bst, :data
        end
      end

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

      def test_traverse
        assert_equal bst.keys, bst.traverse
        assert_equal ['S', 'E', 'A', 'C', 'R', 'H', 'M', 'L', 'P', 'X'], bst.traverse(order: :preorder)
        assert_equal ['C', 'A', 'L', 'P', 'M', 'H', 'R', 'E', 'X', 'S'], bst.traverse(order: :postorder)
      end

      def test_contains?
        assert bst.contains?('A')
        refute bst.contains?('Z')
      end

      def test_min
        assert_equal 'A', bst.min.key
      end

      def test_max
        assert_equal 'X', bst.max.key
      end

      def test_floor
        assert_equal 'E', bst.floor('G')
        assert_equal 'C', bst.floor('D')
      end

      def test_ceiling
        assert_equal 'R', bst.ceiling('Q')
      end

      def test_size
        assert_equal data.uniq.count, bst.size
      end

      def test_empty?
        refute bst.empty?
      end

      def test_rank
        assert_equal 8, bst.rank('S')
      end

      def test_select
        assert_equal 'A', bst.select(0)
        assert_equal 'S', bst.select(8)
      end

      def test_delete_min
        bst.delete_min
        assert_equal data.uniq.sort[1..-1], bst.keys
      end

      def test_delete_max
        bst.delete_max
        assert_equal data.uniq.sort[0..-2], bst.keys
      end

      def test_delete
        bst.delete('A')
        assert_equal (data.uniq - ['A']).sort, bst.keys
        bst.delete('E')
        assert_equal (data.uniq - ['A', 'E']).sort, bst.keys
      end
    end
  end
end
