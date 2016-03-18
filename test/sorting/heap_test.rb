require 'test_helper'

module Algs4ruby
  class Sorting
    class HeapTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      def test_sort_stability
        refute_stable(:insertion)
      end
    end
  end
end
