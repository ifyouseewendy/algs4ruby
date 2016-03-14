require 'test_helper'

module Algs4ruby
  class UnionFindTest < MiniTest::Unit::TestCase
    attr_reader :sets

    STRATEGY = [:quick_find, :quick_union, :weighted_quick_union, :weighted_quick_union_with_path_compression]

    def setup
      count = DATA.readline.strip.to_i

      @sets = STRATEGY.map {|strategy| UnionFind.new(count, strategy: strategy) }

      count.times do
        p, q = DATA.readline.strip.split.map(&:to_i)
        @sets.each{|set| set.union(p,q) }
      end
    end

    def test_connected?
      sets.each do |set|
        assert set.connected?(0, 7)
        refute set.connected?(1, 8)
        assert set.connected?(3, 4)
      end
    end
  end
end

__END__
10
4 3
3 8
6 5
9 4
2 1
8 9
5 0
7 2
6 1
1 0
6 7
