class LinkedStack
  Node = Struct.new(:item, :pointer)

  def initialize
  end

  def push(item)
    node = Node.new(item, @first)
    @first = node
  end

  def pop
    raise 'Pop on empty stack' unless @first

    item = @first.item
    @first = @first.pointer
    item
  end

  class << self
    def test
      sio = StringIO.new("to be or not to - be - - that - - - is")
      stack = self.new

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
