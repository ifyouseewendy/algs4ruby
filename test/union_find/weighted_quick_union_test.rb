require 'test_helper'
require 'algs4ruby/union_find/weighted_quick_union'

class WeightedQuickUnionTest < MiniTest::Unit::TestCase
  def setup
    @io = StringIO.new\
            [
              '10',
              '4 3',
              '3 8',
              '6 5',
              '9 4',
              '2 1',
              '8 9',
              '5 0',
              '7 2',
              '6 1',
              '1 0',
              '6 7'
            ].join("\n")
  end

  def test_weighted_by_size
    set = WeightedQuickUnion.new(@io.readline.strip.to_i)
    while !@io.eof?
      p, q = @io.readline.strip.split.map(&:to_i)
      set.union(p, q)
    end
    assert set.connected?(0, 7)
    refute set.connected?(1, 8)
    assert set.connected?(3, 4)
  end

  def test_weighted_by_size
    set = WeightedQuickUnion.new(@io.readline.strip.to_i, :height)
    while !@io.eof?
      p, q = @io.readline.strip.split.map(&:to_i)
      set.union(p, q)
    end
    assert set.connected?(0, 7)
    refute set.connected?(1, 8)
    assert set.connected?(3, 4)
  end

  def test_weighted_by_other_rank
    set = WeightedQuickUnion.new(@io.readline.strip.to_i, :rank)
    assert_raises NotImplementedError do
      while !@io.eof?
        p, q = @io.readline.strip.split.map(&:to_i)
        set.union(p, q)
      end
    end
  end
end

