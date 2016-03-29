require_relative 'stack_and_queue/linked_list_stack'
require_relative 'stack_and_queue/resizing_array_stack'
require_relative 'stack_and_queue/linked_list_queue'
require_relative 'stack_and_queue/resizing_array_queue'

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

    def initialize(strategy = DEFAULT_STRATEGY)
      @strategy = strategy
      @core     = classify(@strategy).new
    end

    def method_missing(m, *args, &block)
      core.public_send(m, *args, &block)
    end
  end

  class Queue
    include Helper
    extend Forwardable

    STRATEGIES = [
      :linked_list,
      :resizing_array
    ]

    DEFAULT_STRATEGY = :resizing_array

    attr_reader :core, :strategy

    def initialize(strategy = DEFAULT_STRATEGY)
      @strategy = strategy
      @core     = classify(@strategy).new
    end

    def method_missing(m, *args, &block)
      core.public_send(m, *args, &block)
    end
  end
end
