require 'test_helper'

module Algs4ruby
  module UnionFind
    class QuickFindTest < MiniTest::Unit::TestCase
      def setup
        io = StringIO.new\
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

        @set = QuickFind.new(io.readline.strip.to_i)
        while !io.eof?
          p, q = io.readline.strip.split.map(&:to_i)
          @set.union(p, q)
        end
      end

      def test_connected?
        assert @set.connected?(0, 7)
        refute @set.connected?(1, 8)
        assert @set.connected?(3, 4)
      end
    end
  end
end
