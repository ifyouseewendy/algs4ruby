require 'test_helper'

module Algs4ruby
  module Sorting
    class ShufflingTest < MiniTest::Unit::TestCase
      def setup
        # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
        @array = (1..10).to_a
      end

      def test_shuffle
        refute_equal @array.sort, Shuffling.shuffle(@array)
      end

      def test_shuffle_by_sort
        refute_equal @array.sort, Shuffling.shuffle(@array, :sort)
      end
    end
  end
end
