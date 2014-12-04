module Algs4ruby
  module Sorting
    extend Helper

    autoload_modules *\
      %i(
        Selection
        Insertion
        Shell
        Shuffling
        Merge
      )

    class Base
      class << self
        def sort(array, strategy = nil, &block)
          raise 'Not Implemented'
        end

        private

          def less(a, b, &block)
            block_given? ? yield(a,b) : a < b
          end

          def exch(arr, i, j)
            t       = arr[i]
            arr[i]  = arr[j]
            arr[j]  = t
          end
      end

    end
  end
end
