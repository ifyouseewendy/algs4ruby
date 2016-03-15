require 'test_helper'

module Algs4ruby
  class Sorting
    module SortingTestHelper
      def setup
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

      def assert_stable(strategy)
        assert_equal ['Bryant', 'Dapian', 'Larry', 'Liuwei'],
          Sorting.new(strategy).sort(@pairs){|a,b| a.number < b.number }.select{|p| p.number == 8}.map(&:name)
      end

      def refute_stable(strategy)
        refute_equal ['Bryant', 'Dapian', 'Larry', 'Liuwei'],
          Sorting.new(strategy).sort(@pairs){|a,b| a.number < b.number }.select{|p| p.number == 8}.map(&:name)
      end
    end
  end
end
