require 'test_helper'
require 'algs4ruby/sort/shell'

class ShellTest < MiniTest::Unit::TestCase
  def setup
    # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
    @array = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]
  end

  def test_sort
    assert_equal @array.sort, Shell.sort(@array)
    assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
  end
end
