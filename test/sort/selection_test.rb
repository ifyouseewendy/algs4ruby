require 'test_helper'
require 'algs4ruby/sort/selection'

class SelectionTest < MiniTest::Unit::TestCase
  def setup
    # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
    @array = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]
  end

  def test_sort
    assert_equal @array.sort, Selection.sort(@array)
    assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
  end

  def test_sort_by_specific_order
    assert_equal @array.sort.reverse, Selection.sort(@array){|a,b| a > b}
    assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
  end
end
