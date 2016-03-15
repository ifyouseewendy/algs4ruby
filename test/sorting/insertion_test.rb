require 'test_helper'

module Algs4ruby
  class Sorting
    class InsertionTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      def test_sort_stability
        assert_stable(:insertion)
      end
    end
  end
end
