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
        # = In-place vs. Out-of-place
        #
        #   I was coding all kinds of sorting methods in an out-of-place way,
        #   which means no care about the auxiliary space or relative operations.
        #   To be specific:
        #
        #     1. Manipulate and return a cloned array, keeping the array passed in immutable.
        #     2. Writing more natural code by leveraging Ruby, without efficiency concern.
        #        For instance in Merge Sort:
        #
        #         def recursive_sort(array
        #           ...
        #
        #           first   = recursive_sort(array[low..mid])
        #           second  = recursive_sort(array[mid+1..high])
        #           merge(first, second)
        #         end
        #
        #         def merge(first, second)
        #           return first + second if ...
        #           ...
        #         end
        #
        #   Although Merge Sort does need an auxiliary linear space, but maybe I get a little
        #   overhead. Especially when I learned *in-place* (uses only a small auxiliary stack)
        #   is mainly the advantage over Merge Sort, I knew I need a refactor work. Here is my
        #   final thought:
        #
        #     1. Preserve the clone process, no modifying the argument array.
        #     2. Do all in-place change on cloned array.
        #
        #   status: TODO @2014-12-11

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
