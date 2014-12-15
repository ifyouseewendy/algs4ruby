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
        PriorityQueue
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

          # = Block passing around vs. @block
          #
          #   Considering the method chain is getting longer and longer,
          #   and `less` is the only and final place where block yields,
          #   I've updated to store a @block, and assign it at the beginning
          #   of `Quick.sort`. World's clear, but annoying untidy feeling
          #   blows my mind. Because by using instance varialbles, I can not
          #   only save the block, but also make an copy of @array, which makes
          #   all the helper method work without any params.
          #
          #   I know it's the OO style to save the state, but writing algorithms
          #   code is like programming procedure. So I choose to passing the
          #   annoying block in the end.
          def less(a, b)
            if block_given?
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
