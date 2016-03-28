module Algs4ruby
  module Helper
    # Examples
    #
    #   'QuickFind'             # => 'quick_find'
    #   'Algs4ruby::QuickFind'  # => 'algs4ruby/quick_find'
    def filecase(mod)
      mod.to_s.split('::').map{|m|
        m.gsub(/[A-Z]/){|s| "_#{s.downcase}"}[1..-1]
      }.join('/')
    end

    # Examples
    #
    #   'quick_find' # => 'QuickFind'
    def modulecase(str)
      str.to_s.split('_').map(&:capitalize).join('')
    end

    # Examples
    #
    #   'quick_find' # => QuickFind
    def classify(str)
      begin
        Object.const_get modulecase(str)
      rescue NameError
        Object.const_get [self.class.to_s, modulecase(str)].join('::')
      end
    end

    # Public: Autoload implementation class under self namespace.
    #
    # mods - Snake-case module names.
    #
    # Examples
    #
    #   class UnionFind
    #     include Helper
    #
    #     def initialize(strategy: :quick_find)
    #       klass_name = modulecase(strategy)
    #
    #       autoload_modules klass_name
    #       # autoload union_find/quick_find.rb
    #
    #       klass = Object.const_get(klass_name)
    #     end
    #   end
    def autoload_modules(*mods)
      mods.each do |mod|
        autoload(mod,  File.expand_path("#{filecase(self.class)}/#{filecase(mod)}.rb",  File.dirname(__FILE__)) )
      end
    end

  end
end

require_relative 'algs4ruby/version'
require_relative 'algs4ruby/union_find'
require_relative 'algs4ruby/sorting'
require_relative 'algs4ruby/stack_and_queue'
require_relative 'algs4ruby/graph'
require_relative 'algs4ruby/searching'
