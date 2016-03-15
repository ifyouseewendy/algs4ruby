require 'test_helper'

module Algs4ruby
  class Sorting
    class SelectionTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      def test_sort_stability
        refute_stable(:selection)
      end
    end
  end
end
