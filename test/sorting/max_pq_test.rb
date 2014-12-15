require 'test_helper'

module Algs4ruby
  module Sorting
    class MaxPQTest < MiniTest::Unit::TestCase
      class MaxPQ
        # check if subtree of pq[1..N] rooted at k is a max heap
        def is_max_heap_at(k)
          return true if k > size

          left, right = 2*k, 2*k+1
          return false if [left,right].any?{|i| i < size && less(k, i)}

          return [left,right].all?{|i| is_max_heap_at(i)}
        end
      end

      def setup
        @array = [9, 3, 5, 2, 0, 6, 4, 5, 3, 5]
        @max_pq    = MaxPQ.new

        people_class = Struct.new(:name, :number, :team)
        @people = [
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
        @max_pq_object = MaxPQ.new{|a,b| a.name < b.name }
      end

      def test_insert
        @array.each{|item| @max_pq.insert item}
        assert @max_pq.is_max_heap_at(1)
      end

      def test_insert_object
        @people.each{|item| @max_pq_object.insert item}
        assert @max_pq_object.is_max_heap_at(1)
      end

      def test_delete_max
        arr = []
        while !@max_pq.empty?
          arr << @max_pq.delete_max
        end
        assert_equal @array.sort.reverse, arr
      end

      def test_delete_max_object
        assert_equal 'Wendi', @max_pq_object.delete_max.name
      end

    end
  end
end
