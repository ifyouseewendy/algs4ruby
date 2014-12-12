module Algs4ruby
  module Sorting

    class Quick < Base
      class << self
        # = O(NlgN)
        #
        #   1/3 faster than MergeSort empirically,
        #   because of less data movement.
        #
        # = Not stable
        #
        # = In-place
        #
        #   This is an in-place version of implemention.
        #
        #   But not strict technically because of the out-of-place
        #   version of Shuffling and Insertion.
        #
        #   Quick sort can not or hard to make out-of-space version,
        #   as partition need to manipulate the array.
        #
        # = Improvements
        #
        #   + Sort manually (Insertion) for small arrays.
        #   + Exchange median before partition.


        def sort(array, strategy = :default, &block)
          @block = block

          array = Shuffling.shuffle(array) # already cloned

          self.class_eval{ extend const_get("Strategy::#{strategy.capitalize}") }
          recursive_sort(array, 0, array.length-1)

          array
        end
      end

      module Strategy
        module Default
          CUTOFF = 5

          def recursive_sort(array, lo, hi)
            return if lo >= hi

            len = hi - lo + 1
            return manual_sort(array, lo, hi) if len <= CUTOFF

            median = median3_of(array, lo, lo+len/2, hi)
            exch(array, lo, median)

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

          private

            def manual_sort(array, lo, hi)
              # Insertion for small arrays.
              arr = Insertion.sort(array[lo..hi], &@block)
              (lo..hi).each_with_index{|i,j| array[i] = arr[j] }
              nil
            end

            def median3_of(a, i, j, k)
              if less(a[i], a[j])
                less(a[j], a[k]) ? j : (less(a[i], a[k]) ? k : i)
              else
                less(a[i], a[k]) ? i : (less(a[j], a[k]) ? k : j)
              end
            end
        end

        module EntropyOptimal # Dijkstra 3 way partition
        end
      end

    end

  end
end
