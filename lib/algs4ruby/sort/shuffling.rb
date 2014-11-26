require_relative 'insertion'

class Shuffling
  class << self

    ##
    # Knuth Shuffle O(N)
    #
    def shuffle(array)
      arr = array.clone
      n   = arr.length

      (0..n-1).each do |i|
        r = rand(i+1)
        exch(arr, i, r)
      end

      arr
    end

    ##
    # Shuffle based on sort, O(NlgN)
    #
    Pair = Struct.new(:num, :value) do
      def <(other)
        value < other.value
      end
    end

    def shuffle2(array)
      n   = array.length
      pairs = (0..n-1).reduce([]){|res, i| res << Pair.new(array[i], rand(n)) }
      Insertion.sort(pairs).map(&:num)
    end

    private

      def exch(arr, i, j)
        t       = arr[i]
        arr[i]  = arr[j]
        arr[j]  = t
      end

  end
end
