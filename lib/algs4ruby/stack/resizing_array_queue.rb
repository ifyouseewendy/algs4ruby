class ResizingArrayQueue
  def initialize(count)
    @head = @tail = 0
    @stack = Array.new(count)
  end

  def enqueue(item)
    @stack[@tail] = item

    @tail += 1
    resize(2*@stack.length) if valid_count == @stack.length

    @tail %= capacity
    return
  end

  def dequeue
    item = @stack[@head]

    @head += 1
    resize(@stack.length/2) if valid_count == @stack.length/4 && valid_count != 0

    @head %= capacity
    return item
  end

  def valid_count
    count = @tail - @head
    count += capacity if count < 0
    count
  end

  def capacity
    @stack.length
  end

  def empty?
    valid_count == 0
  end

  def next_pos_of(num)
    (num+1) % capacity
  end

  private

    def resize(count)
      # puts "--> Resized. before: #{@stack.length}, after: #{count}"

      # Really trick resize logic
      @stack = Array.new(count) do |i|
        if @head > @tail
          (@head + i <= @tail + capacity) ? @stack[ @head+i ] : nil
        else
          (@head + i <= @tail) ? @stack[ @head+i ] : nil
        end
      end

      @tail = ( @tail - @head ) % capacity
      @head = 0

      return
    end

  class << self
    def test
      sio = StringIO.new("to be or not to - be - - that - - - is - a - - question -")
      stack = self.new(2)

      sio.readline.split.each do |item|
        if item == '-'
          puts stack.dequeue
        else
          stack.enqueue item
        end
      end

      return
    end
  end
end
