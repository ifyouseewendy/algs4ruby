module Algs4ruby
  class UnionFind
    class Base
      attr_reader :ids

      def initialize(n)
        @ids = Array.new(n){|i| i}
      end

      def union(p, q)
      end

      def connected?(p, q)
      end

      private

        def to_s
          [
            (0...ids.count).to_a.join(' '),
            ids.join(' ')
          ].join("\n")
        end
    end
  end
end
