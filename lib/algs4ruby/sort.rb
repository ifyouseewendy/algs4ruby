module Sorting
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

require_relative 'sort/selection'
require_relative 'sort/insertion'
require_relative 'sort/shell'
require_relative 'sort/shuffling'
require_relative 'sort/merge'
