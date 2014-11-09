class FixedCapacityStack
  def initialize(capacity)
    @n = 0
    @stack = Array.new(capacity)
  end

  def push(item)
    @stack[@n] = item
    @n += 1
    return
  end

  def pop
    @n -= 1
    return @stack[@n]
  end

  class << self
    def test
      sio = StringIO.new("to be or not to - be - - that - - - is")
      stack = self.new(10)

      sio.readline.split.each do |item|
        if item == '-'
          puts stack.pop
        else
          stack.push item
        end
      end

      return
    end
  end
end
