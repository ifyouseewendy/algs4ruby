require_relative 'sorting/base'
require_relative 'sorting/insertion'
require_relative 'sorting/selection'
require_relative 'sorting/shell'
require_relative 'sorting/shuffling'
require_relative 'sorting/merge'
require_relative 'sorting/quick'
require_relative 'sorting/priority_queue'
# require_relative 'sorting/heap'

module Algs4ruby
  class Sorting
    include Helper

    STRATEGIES = [
      :insertion,
      :selection,
      :shell,
      :merge,
      :quick
    ]

    DEFAULT_STRATEGY = :quick

    attr_reader :core, :strategy

    def initialize(strategy = DEFAULT_STRATEGY)
      @strategy = strategy
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
