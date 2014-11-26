class Shuffling
  class << self

    ##
    # Knuth Shuffle O(N)
    #
    def sort(array)
      arr = array.clone
      n   = arr.length

      (0..n-1).each do |i|
        r = rand(i+1)
        exch(arr, i, r)
      end

      arr
    end

    private

      def exch(arr, i, j)
        t       = arr[i]
        arr[i]  = arr[j]
        arr[j]  = t
      end

  end
end
