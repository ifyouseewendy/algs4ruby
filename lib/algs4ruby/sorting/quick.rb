module Algs4ruby
  module Sorting

    class Quick < Base
      class << self
        include Algs4ruby::Helper

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


        # <param>
        #
        #   strategy - :default, :three_way
        #
        def sort(array, strategy = :default, &block)
          array = Shuffling.shuffle(array) # already cloned

          klass = Sorting.const_get("QuickBy#{modulecase(strategy)}")
          klass.sort(array, 0, array.length-1, &block)

          array
        end

      end
    end

    class QuickByDefault < Quick
      class << self
        CUTOFF = 5

        def sort(array, lo, hi, &block)
          return if lo >= hi

          len = hi - lo + 1
          return manual_sort(array, lo, hi, &block) if len <= CUTOFF

          median = median3_of(array, lo, lo+len/2, hi, &block)
          exch(array, lo, median)

          pivot = partition(array, lo, hi, &block)

          sort(array, lo, pivot-1, &block)
          sort(array, pivot+1, hi, &block)
        end

        def partition(array, lo, hi, &block)
          pivot = lo
          i, j = lo, hi+1

          loop do
            begin
              i += 1
              break if i == hi
            end while less(array[i], array[pivot], &block)

            begin
              j -= 1
              break if j == lo
            end while less(array[pivot], array[j], &block)

            break if i >= j
            exch(array, i, j)
          end

          exch(array, pivot, j)

          return j
        end

        private

          def manual_sort(array, lo, hi, &block)
            # Insertion for small arrays.
            arr = Insertion.sort(array[lo..hi], &block)
            (lo..hi).each_with_index{|i,j| array[i] = arr[j] }
            nil
          end

          def median3_of(a, i, j, k, &block)
            if less(a[i], a[j], &block)
              less(a[j], a[k], &block) ? j : (less(a[i], a[k], &block) ? k : i)
            else
              less(a[i], a[k], &block) ? i : (less(a[j], a[k], &block) ? k : j)
            end
          end
      end
    end

    # It reduces the time of the sort from *linearithmic* to *linear* for arrays
    # with large numbers of duplicate keys.
    #
    # Quicksort with 3-way partitioning uses ~(2ln2)NH compares to sort N items,
    # where H is the Shannon entropy, defined from the frequencies of key values.
    #
    # Worse case:  ~ NlgN, H = lgN when keys are all distinct.
    # Best  case:  ~ N, if the number ofr distinct keys is constant.
    module ThreeWay # Entropy-optimal
    end

  end
end
