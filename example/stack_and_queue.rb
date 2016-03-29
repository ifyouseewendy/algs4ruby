stack = Algs4ruby::Stack.new # Default strategy is :resizing_array

stack.push(1)
stack.push(2)
stack.push(3)

stack.size                  # => 3
stack.each{|ele| print ele} # => 321

stack.pop # => 3
stack.pop # => 2
stack.pop # => 1
stack.pop # => RuntimeError: Pop on empty stack


queue = Algs4ruby::Queue.new # Default strategy is :resizing_array

queue.enq(1)
queue.enq(2)
queue.enq(3)

queue.size                  # => 3
queue.each{|ele| print ele} # => 123

queue.deq # => 1
queue.deq # => 2
queue.deq # => 3
queue.deq # => RuntimeError: Deq on empty queue
