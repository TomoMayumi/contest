class BinHeap
  attr_reader :size
  def initialize(buf=nil)
    @buf=buf||[]
    @size=@buf.size
  end
  def add(n)
    i=@size
    @size+=1
    while i>0 && n<b=@buf[j=(i-1)/2]
      @buf[i]=b
      i=j
    end
    @buf[i]=n
  end
  def get
    return if @size<1
    ret=@buf[i=0]
    a=@buf[l=@size-=1]
    while (c=i*2+1)<l
      c+=1 if (d=@buf[c+1])&&@buf[c]>d
      break if a<=b=@buf[c]
      @buf[i]=b
      i=c
    end
    @buf[i]=a
    ret
  end
  def dup
    BinHeap.new(@buf[0,@size])
  end
end
N=gets.to_i
adj=(0..N).map{[]}
(N-1).times{
  a,b=gets.split.map(&:to_i)
  adj[a]<<b
  adj[b]<<a
}
q=BinHeap.new
gone=[nil]*(N+1)
gone[1]=q.add(1)
ans=[]
while d=q.get
  ans<<d
  adj[d].each{|i|gone[i]||=q.add(i)}
end
puts ans*" "