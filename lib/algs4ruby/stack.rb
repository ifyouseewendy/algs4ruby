require 'forwardable'
require_relative 'stack/linked_list'
require_relative 'stack/resizing_array'

# require_relative 'stack_and_queue/resizing_array_queue'
# require_relative 'stack_and_queue/linked_queue'

module Algs4ruby
  class Stack
    include Helper
    extend Forwardable

    STRATEGIES = [
      :linked_list,
      :resizing_array
    ]

    DEFAULT_STRATEGY = :resizing_array

    attr_reader :core, :strategy

    def_delegators :core, :push, :pop, :empty?, :size

    def initialize(strategy = DEFAULT_STRATEGY)
      @strategy = strategy
      @core     = classify(@strategy).new
    end
  end
end
