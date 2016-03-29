require 'test_helper'

module Algs4ruby
  class StackTest < MiniTest::Test
    attr_reader :stacks

    def setup
      @stacks = Stack::STRATEGIES.map{|strategy| Stack.new(strategy)}
    end

    def data
      @data ||= DATA.readline.strip.split
    end

    def test_size
      stacks.each do |stack|
        assert_equal 0, stack.size
        stack.push('a')
        assert_equal 1, stack.size
      end
    end

    def test_empty
      stacks.each do |stack|
        assert stack.empty?
      end
    end

    def test_push_and_pop
      stacks.each do |stack|
        expected = 'to be or not to be that is'
        res = []

        res = data.reduce([]) do |ar, item|
          if item == '-'
            ar << stack.pop
          else
            stack.push(item)
            ar
          end
        end

        assert_equal expected, res.join(' ')
      end
    end

    def test_empty_pop
      stacks.each do |stack|
        assert stack.empty?
        assert_raises RuntimeError, 'Pop on empty stack' do
          stack.pop
        end
      end
    end

    def test_enumerable
      items = %w(to be or not to be that is)

      stacks.each do |stack|
        items.each{|item| stack.push(item) }

        assert_equal items.reverse, stack.map.to_a
      end
    end
  end
end

__END__
be to not or to - be - - - - - that - is -
