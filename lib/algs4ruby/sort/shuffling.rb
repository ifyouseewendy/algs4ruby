module Sorting

  class Shuffling < Base
    class << self

      def shuffle(array, strategy = :knuth)
        send("#{strategy}_shuffle", array)
      end

      private

        ##
        # Knuth Shuffle O(N)
        #
        def knuth_shuffle(array)
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
        def sort_shuffle(array)
          pair_class = Struct.new(:num, :value) do
            def <(other)
              value < other.value
            end
          end

          n   = array.length
          pairs = (0..n-1).reduce([]){|res, i| res << pair_class.new(array[i], rand(n)) }
          Insertion.sort(pairs).map(&:num)
        end

    end
  end

end
