module Algs4ruby
  module Helper
    # 'QuickFind' => 'quick_find'
    # 'Algs4ruby::QuickFind' => 'algs4ruby/quick_find'
    def filecase(mod)
      mod.to_s.split('::').map{|m|
        m.gsub(/[A-Z]/){|s| "_#{s.downcase}"}[1..-1]
      }.join('/')
    end

    # 'quick_find' => 'QuickFind'
    def modulecase(str)
      str.to_s.split('_').map(&:capitalize).join('')
    end

    def autoload_modules(*mods)
      mods.each do |mod|
        autoload(mod,  File.expand_path("#{filecase(self)}/#{filecase(mod)}.rb",  File.dirname(__FILE__)) )
      end
    end

  end
  extend Helper

  autoload_modules(
    :Graph,
    :Sorting,
    :StackAndQueue,
    :Version,
    :UnionFind
  )
end
