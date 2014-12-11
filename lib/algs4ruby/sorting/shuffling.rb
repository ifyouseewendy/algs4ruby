module Algs4ruby
  module Sorting

    class Shuffling < Base
      class << self
        # = O(N)
        #
        #   by Knuth Shuffle
        #
        # = O(NlgN)
        #
        #   by Sort Shuffle

        def shuffle(array, strategy = :knuth)
          send("#{strategy}_shuffle", array)
        end

        private

          def knuth_shuffle(array)
            arr = array.clone
            n   = arr.length

            (0..n-1).each do |i|
              r = rand(i+1)
              exch(arr, i, r)
            end

            arr
          end

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
end
