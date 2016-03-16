require 'test_helper'

module Algs4ruby
  class Sorting
    class MergeTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      attr_reader :sorting, :array, :origin_array

      def setup
        @sorting      = Sorting::Merge.new

        @array        = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]
        @origin_array = @array
        super
      end

      def test_sort
        expected = array.sort
        assert_equal expected, sorting.sort(array)
        assert_equal origin_array, array
      end

      def test_sort!
        expected = array.sort
        assert_nil sorting.sort!(array)
        assert_equal expected, array
      end

      def test_sort_by_specific_order
        assert_equal array.sort.reverse, sorting.sort(array){|a,b| a > b}
      end

      def test_another_strategy
        expected = array.sort
        assert_equal expected, sorting.sort(array, :bottom_up)
      end

      def test_sort_stability
        assert_stable(:merge)
      end

    end
  end
end
