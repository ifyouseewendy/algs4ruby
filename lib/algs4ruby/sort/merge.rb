require_relative 'insertion'

class Merge
  class << self

    ##
    # Practical Improvement
    #
    # 1. Add cutoff, use Insertion for small arrays
    # 2. No merge if already sorted

    CUTOFF = 7

    def sort(array, strategy = :recursive)
      send("#{strategy}_sort", array)
    end

    private

      def recursive_sort(array)
        # by Default, return array if array.count == 1
        return Insertion.sort(array) if array.count <= CUTOFF

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
        return first + second if second.empty? or less(first[-1], second[0])

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
