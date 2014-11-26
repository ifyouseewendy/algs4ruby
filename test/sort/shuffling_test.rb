require 'test_helper'
require 'algs4ruby/sort/shuffling'

class ShufflingTest < MiniTest::Unit::TestCase
  def setup
    # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
    @array = (1..10).to_a
  end

  def test_sort
    refute_equal @array.sort, Shuffling.shuffle(@array)
    refute_equal @array.sort, Shuffling.shuffle2(@array)
  end
end
