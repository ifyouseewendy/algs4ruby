require 'test_helper'
require 'algs4ruby/searching/application/line_segment_intersection'

module Algs4ruby
  class Searching
    module Application
      class LineSegmentIntersectionTest < MiniTest::Test
        def setup
          raw = [
            [ [1, 1], [5, 1] ],
            [ [2, 2], [3, 2] ],
            [ [3, 3], [9, 3] ],
            [ [4, 0], [4, 4] ]
          ]

          segments = raw.map do |seg|
            LineSegmentIntersection::Segment.new(
              LineSegmentIntersection::Point.new(*seg[0]),
              LineSegmentIntersection::Point.new(*seg[1])
            )
          end

          @line_segment = LineSegmentIntersection.new(segments)
        end

        def test_intersection
          assert_equal 2, @line_segment.intersection
        end

      end
    end
  end
end

#   7 *
#   6 *
#   5 *
#   4 *       |
#   3 *     --|----------
#   2 *   --- |
#   1 * ------|--
#   0 * * * * | * * * * * *
#     0 1 2 3 4 5 6 7 8 9 10
