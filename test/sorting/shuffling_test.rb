require 'test_helper'

module Algs4ruby
  class Sorting
    class ShufflingTest < MiniTest::Test
      attr_reader :sorting, :array, :origin_array

      def setup
        @sorting      = Sorting.new(:shuffling)
        @array        = (1..10).to_a
        @origin_array = @array
      end

      def test_sort
        refute_equal @array.sort, sorting.sort(@array)
        assert_equal @array.sort, @array
      end

      def test_sort!
        refute_equal @array.sort, sorting.sort!(@array)
        refute_equal @array.sort, @array
      end
    end
  end
end
