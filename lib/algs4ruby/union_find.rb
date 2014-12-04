module Algs4ruby
  module UnionFind
    extend Helper

    autoload_modules *\
      %i(
        QuickFind
        QuickUnion
        WeightedQuickUnion
        WeightedQuickUnionWithPathCompression
      )

    class Base
      def initialize(n)
        @id = Array.new(n){|i| i}
      end

      def union(p, q)
      end

      def connected?(p, q)
      end

      private

        def to_s
          [
            (0...@id.count).to_a.join(' '),
            @id.join(' ')
          ].join("\n")
        end
    end
  end
end
