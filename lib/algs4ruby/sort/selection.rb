class Selection
  class << self

    def sort(array)
      arr = array.clone
      n = arr.length

      0.upto(n-2) do |i|
        min = i
        (i+1).upto(n-1) do |j|
          min = j if less(arr[j], arr[min])
        end
        exch(arr, i, min) if i != min
      end

      arr
    end

    def less(a, b)
      a < b
    end

    def exch(arr, i, j)
      t = arr[i]
      arr[i] = arr[j]
      arr[j] = t
    end

  end
end
