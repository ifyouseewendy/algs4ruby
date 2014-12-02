class Merge
  class << self

    def sort(array)
      _sort(array, 0, array.length-1)
    end

    private

      def _sort(array, low, high)
        mid   = (low + high)/2

        return [ array[low] ] if low >= high

        first   = _sort(array, low, mid)
        second  = _sort(array, mid+1, high)
        merge(first, second)
      end

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
