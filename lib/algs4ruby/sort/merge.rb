require_relative 'insertion'

class Merge
  class << self

    ##
    # OPTI
    #
    # 1. Add cutoff, use Insertion for small arrays
    # 2. No merge if already sorted
    #

    CUTOFF = 7

    def sort(array)
      # by Default, return array if array.count == 1
      return Insertion.sort(array) if array.count <= CUTOFF

      low, high = 0, array.length-1
      mid = (low+high)/2

      first   = sort(array[low..mid])
      second  = sort(array[mid+1..high])

      return array if less(first[-1], second[0])
      merge(first, second)
    end

    private

      def merge(first, second)
        i, j = 0, 0
        aux = []

        while i < first.length || j < second.length
          if i >= first.length
            aux << second[j]; j += 1
          elsif j >= second.length
            aux << first[i]; i += 1
          elsif less(first[i], second[j])
            aux << first[i]; i += 1
          else
            aux << second[j]; j += 1
          end
        end

        aux
      end

      def less(a, b)
        a < b
      end
  end
end
