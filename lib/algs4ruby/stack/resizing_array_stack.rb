class ResizingArrayStack
  def initialize(capacity)
    @n = 0
    @stack = Array.new(capacity)
  end

  def push(item)
    resize(2*@stack.length) if @n == @stack.length

    @stack[@n] = item
    @n += 1
    return
  end

  def pop
    resize(@stack.length/2) if @n == @stack.length/4

    @n -= 1
    item = @stack[@n]
    puts "--> Popped, current count: #{@n}"
    return item
  end

  private

    def resize(capacity)
      puts "--> Resized. before: #{@stack.count}, after: #{capacity}"
      @stack = Array.new(capacity){|i| @stack[i]}
    end

  class << self
    def test
      sio = StringIO.new("to be or not to - be - - that - - - is - -")
      stack = self.new(2)

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
