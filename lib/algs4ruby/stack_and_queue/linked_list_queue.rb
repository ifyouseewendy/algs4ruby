class LinkedQueue
  Node = Struct.new(:item, :pointer)

  def initialize
  end

  def enqueue(item)
    old_last = @last
    @last = Node.new(item, nil)

    if empty?
      @first = @last
    else
      old_last.pointer = @last
    end
  end

  def dequeue
    raise 'EmptyQueue' if @first.nil?

    item = @first.item
    @first = @first.pointer
    @last = nil if empty?

    return item
  end

  def empty?
    @first == nil
  end

  class << self
    def test
      sio = StringIO.new("to be or not to - be - - that - - - is - a - - question -")
      stack = self.new

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
