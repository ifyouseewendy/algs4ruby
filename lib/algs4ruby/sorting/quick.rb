module Algs4ruby
  module Sorting

    class Quick < Base
      class << self
        # O(NlgN)
        #   1/3 faster than MergeSort empirically,
        #   because of less data movement.
        #
        # Not stable

        # This is an in-place version of implemention.
        #
        # But not strict technically because of the out-of-place
        # version of Shuffling and Insertion.
        #
        # Quick sort can not or hard to make out-of-space version,
        # as partition need to manipulate the array.

        # TODO
        #
        # 1. make out-of-place version
        # 2. make in-place version

        def sort(array, strategy = :recursive, &block)
          @block = block

          array = Shuffling.shuffle(array) # already cloned
          recursive_sort(array, 0, array.length-1)
          array
        end

        private

          def recursive_sort(array, lo, hi)
            return if lo >= hi

            pivot = partition(array, lo, hi)

            recursive_sort(array, lo, pivot-1)
            recursive_sort(array, pivot+1, hi)
          end

          def partition(array, lo, hi)
            pivot = lo
            i, j = lo, hi+1

            loop do
              begin
                i += 1
                break if i == hi
              end while less(array[i], array[pivot])

              begin
                j -= 1
                break if j == lo
              end while less(array[pivot], array[j])

              break if i >= j
              exch(array, i, j)
            end

            exch(array, pivot, j)

            return j
          end

      end
    end

  end
end
