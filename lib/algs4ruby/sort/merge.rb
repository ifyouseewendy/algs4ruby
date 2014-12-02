class Merge
  class << self

    def sort(array)
      return array if array.count == 1

      low, high = 0, array.length-1
      mid = (low+high)/2

      first   = sort(array[low..mid])
      second  = sort(array[mid+1..high])
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
