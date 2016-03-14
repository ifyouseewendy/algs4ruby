require_relative 'union_find/base'
require_relative 'union_find/quick_find'
require_relative 'union_find/quick_union'
require_relative 'union_find/weighted_quick_union'
require_relative 'union_find/weighted_quick_union_with_path_compression'

module Algs4ruby
  class UnionFind
    include Helper

    STRATEGIES = [
      :quick_find,
      :quick_union,
      :weighted_quick_union,
      :weighted_quick_union_with_path_compression
    ]
    DEFAULT_STRATEGY = [:weighted_quick_union_with_path_compression]

    attr_reader :core

    def initialize(n, strategy: DEFAULT_STRATEGY)
      @core = classify(strategy).new(n)
    end

    def union(p, q)
      core.union(p, q)
    end

    def connected?(p, q)
      core.connected?(p, q)
    end

  end
end
