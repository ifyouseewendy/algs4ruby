require 'test_helper'

module Algs4ruby
  class Sorting
    class MergeTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      def test_sort_stability
        assert_stable(:merge)
      end
    end
  end
end
