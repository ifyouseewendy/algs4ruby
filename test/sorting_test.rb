require 'test_helper'

module Algs4ruby
  class SortingTest < MiniTest::Unit::TestCase
    attr_reader :sortings, :array, :origin_array, :pairs

    def setup
      @sortings = Sorting::STRATEGIES.map{|strategy| Sorting.new(strategy)}

      # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
      @array = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]
      @origin_array = @array
    end

    def test_sort
      sortings.each do |sorting|
        expected = array.sort
        assert_equal expected, sorting.sort(array)
        assert_equal origin_array, array
      end
    end

    def test_sort!
      sortings.each do |sorting|
        expected = array.sort
        assert_nil sorting.sort!(array)
        assert_equal expected, array
      end
    end

    def test_sort_by_specific_order
      sortings.each do |sorting|
        assert_equal array.sort.reverse, sorting.sort(array){|a,b| a > b}
      end
    end

  end
end
