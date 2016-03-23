require 'algs4ruby/searching'

module Algs4ruby
  class Searching
    module Application
      class LineSegmentIntersection
        Point = Struct.new(:x, :y) do
          def to_s
            "(#{x}, #{y})"
          end
        end

        Segment = Struct.new(:left, :right) do
          def horizontal?
            left.y == right.y
          end

          def vertical?
            left.x == right.x
          end

          def to_s
            [left, right].map(&:to_s).join(' - ')
          end
        end

        attr_accessor :segments, :bst

        def initialize(segments)
          @segments = segments
          @bst = Searching::RedBlackBST.new
        end

        def intersection
          count = 0

          data = segments.reduce([]) do |ar, seg|
            if seg.horizontal?
              ar << [seg.left, :left, seg]
              ar << [seg.right, :right, seg]
            elsif seg.vertical?
              ar << [seg.left, :left, seg]
            else
              raise "Un-orthogonal Segment #{segment}"
            end
          end

          data = data.sort_by{|ar| ar[0].x}

          data.each do |ar|
            point, endpoint, seg = *ar

            if seg.horizontal?
              if :left == endpoint
                bst.put(point.y, :empty)
              else
                bst.delete(point.y)
              end
            else
              count += bst.size_in_range(seg.left.y, seg.right.y)
            end
          end

          count
        end
      end
    end
  end
end
