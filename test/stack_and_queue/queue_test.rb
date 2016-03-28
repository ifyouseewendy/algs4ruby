require 'test_helper'

module Algs4ruby
  class QueueTest < MiniTest::Test
    attr_reader :queues

    def setup
      @queues = Queue::STRATEGIES.map{|strategy| Queue.new(strategy)}
    end

    def data
      @data ||= DATA.readline.strip.split
    end

    def test_size
      queues.each do |queue|
        assert_equal 0, queue.size
        queue.enq('a')
        assert_equal 1, queue.size
      end
    end

    def test_empty
      queues.each do |queue|
        assert queue.empty?
      end
    end

    def test_enq_and_deq
      queues.each do |queue|
        expected = 'to be or not to be that is'
        res = []

        res = data.reduce([]) do |ar, item|
          if item == '-'
            ar << queue.deq
          else
            queue.enq(item)
            ar
          end
        end

        assert_equal expected, res.join(' ')
      end
    end

    def test_empty_pop
      queues.each do |queue|
        assert queue.empty?
        assert_raises RuntimeError, 'Deq on empty queue' do
          queue.deq
        end
      end
    end
  end
end

__END__
to be or not to - be - - - - that - - is -
