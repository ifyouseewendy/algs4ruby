module Algs4ruby
  module Sorting

    class Quick < Base
      class << self
        # O(NlgN)
        #   1/3 faster than MergeSort empirically,
        #   because of less data movement.
        #
        # Not stable

        # TODO
        #
        # 1. make out-of-place version
        # 2. make in-place version

        CUTOFF = 7


      end
    end

  end
end
