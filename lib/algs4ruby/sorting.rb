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
        Quick
      )

    class Base
      class << self
        def sort(array, strategy = nil, &block)
          raise 'Not Implemented'
        end

        private

          def less(a, b, &block)
            if @block
              @block.call(a,b)
            elsif block_given?
              yield(a,b)
            else
              a < b
            end
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
