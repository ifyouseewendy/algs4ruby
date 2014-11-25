class Insertion
  class << self

    def sort(array)
      arr = array.clone
      n   = arr.length

      0.upto(n-2) do |i|
        (i+1).downto(1) do |j|
          exch(arr, j, j-1) if less(arr[j], arr[j-1])
        end
      end

      arr
    end

    private

      def less(a, b)
        a < b
      end

      def exch(arr, i, j)
        t       = arr[i]
        arr[i]  = arr[j]
        arr[j]  = t
      end

  end
end
