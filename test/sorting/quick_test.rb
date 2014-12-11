require 'test_helper'

module Algs4ruby
  module Sorting
    class QuickTest < MiniTest::Unit::TestCase
      def setup
        # 10.times.reduce([]){|ar, i| ar << rand(10) }.join(', ')
        @array = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]

        people_class = Struct.new(:name, :number, :team)
        @pairs = [
          people_class.new('Bryant',  8, 'Lakers'),
          people_class.new('Dapian',  8, 'Rockets'),
          people_class.new('Erving',  2, 'Cavaliers'),
          people_class.new('Iverson', 3, '76ers'),
          people_class.new('Larry',   8, 'Raptors'),
          people_class.new('Liuwei',  8, 'Sharks'),
          people_class.new('McGrady', 1, 'Rockets'),
          people_class.new('Rose',    1, 'Bulls'),
          people_class.new('Wendi',   3, 'Heat'),
        ]
      end

      def test_sort
        assert_equal @array.sort, Quick.sort(@array)
        assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
      end

      def test_sort_by_specific_order
        assert_equal @array.sort.reverse, Quick.sort(@array){|a,b| a > b}
        assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
      end

      def test_sort_by_bottum_up
        skip
        assert_equal @array.sort, Quick.sort(@array, :bottom_up)
        assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
      end

      def test_sort_by_bottum_up_by_specific_order
        skip
        assert_equal @array.sort.reverse, Quick.sort(@array, :bottom_up){|a,b| a > b}
        assert_equal [9, 3, 5, 2, 0, 6, 4, 5, 3, 5], @array
      end

      def test_sort_stability
        refute_equal ['Bryant', 'Dapian', 'Larry', 'Liuwei'],
          Quick.sort(@pairs){|a,b| a.number < b.number }.select{|p| p.number == 8}.map(&:name)

        refute_equal ['Bryant', 'Dapian', 'Larry', 'Liuwei'],
          Quick.sort(@pairs, :bottom_up){|a,b| a.number < b.number }.select{|p| p.number == 8}.map(&:name)
      end
    end
  end
end