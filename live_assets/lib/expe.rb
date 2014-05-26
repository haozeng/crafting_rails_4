require 'thread'

q = Queue.new

t = thread.new do
  while last = q.pop
    sleep(1)
    puts last
  end
end
