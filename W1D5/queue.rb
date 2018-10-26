class Queue
  attr_accessor :queue

  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    @queue.last
  end
end
