require_relative 'sorting/base'
require_relative 'sorting/insertion'
require_relative 'sorting/selection'
# require_relative 'sorting/heap'
# require_relative 'sorting/merge'
# require_relative 'sorting/priority_queue'
# require_relative 'sorting/quick'
# require_relative 'sorting/shell'
# require_relative 'sorting/shuffling'

module Algs4ruby
  class Sorting
    include Helper

    STRATEGIES = [
      :insertion,
      :selection
    ]

    DEFAULT_STRATEGY = :insertion

    attr_reader :core, :strategy

    def initialize(strategy)
      @strategy = strategy || DEFAULT_STRATEGY
      @core     = classify(@strategy).new
    end

    def sort(array, &block)
      core.sort(array, &block)
    end

    def sort!(array, &block)
      core.sort!(array, &block)
    end

  end
end
