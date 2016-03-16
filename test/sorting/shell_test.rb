require 'test_helper'

module Algs4ruby
  class Sorting
    class ShellTest < MiniTest::Unit::TestCase
      include SortingTestHelper

      def test_sort_stability
        refute_stable(:shell)
      end
    end
  end
end
