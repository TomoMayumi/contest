require "ac-library-rb/priority_queue"
include AcLibraryRb

n,k=gets.split.map(&:to_i)
now=0
time=0
q=PriorityQueue.new{|x,y|x[0]<y[0]}
n.times{
  a,b,c=gets.split.map(&:to_i)
  while q.top && (q.top[0]<=a || now+c > k)
    t1,t2=q.pop
    now-=t2
    time=t1
  end
  time = [time,a].max
  p time
  now+=c
  q << [time+b,c]
}