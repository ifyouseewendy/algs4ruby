module Algs4ruby
  module Sorting

    class Merge < Base
      class << self
        # = O(NlgN)
        #
        # = Stable
        #
        # = Out-of-place
        #
        #   Using auxiliary arrays.
        #
        # = Practical Improvements
        #
        #   + Sort manually (Insertion) for small arrays.
        #   + No merge if already sorted.

        def sort(array, strategy = :recursive, &block)
          @block = block
          send("#{strategy}_sort", array)
        end

        private

          CUTOFF = 7

          def recursive_sort(array)
            # by Default, return array if array.count == 1
            return manual_sort(array) if array.count <= CUTOFF

            low, high = 0, array.length-1
            mid = (low+high)/2

            first   = recursive_sort(array[low..mid])
            second  = recursive_sort(array[mid+1..high])

            merge(first, second)
          end

          def bottom_up_sort(array)
            arr   = array
            len   = array.length
            size  = 1

            while size < len
              arr = 0.step(len-1, 2*size).reduce([]) do |ret, i|
                first   = arr[i..i+size-1]
                second  = arr[i+size..([len-1, i+2*size-1].min)] || []
                ret + merge(first, second)
              end

              size = 2*size
            end

            arr
          end

          def merge(first, second)
            # No merge if already sorted
            return first + second if second.empty? or less(first[-1], second[0])

            i, j = 0, 0
            aux = []

            while i < first.length || j < second.length
              if i >= first.length
                aux << second[j]; j += 1
              elsif j >= second.length
                aux << first[i]; i += 1
              elsif less(second[j], first[i])
                # Pick element in first half when equal, which makes merge sort stable
                aux << second[j]; j += 1
              else
                aux << first[i]; i += 1
              end
            end

            aux
          end

          def manual_sort(array)
            Insertion.sort(array, &@block)
          end

      end
    end

  end
end
