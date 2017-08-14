class Array
def mmin(a);self.zip(a).map(&:min)end
def sum;self.inject(:+)end
def -(a);self.zip(a).map{|i,j|i-j}end
end
y=gets.split.map &:to_i
gets
z=%w(G C P).map{|i|$_.count i}
t=y.mmin(z.rotate)
cnt=t.sum*3
y-=t
z-=t.rotate 2
p cnt+y.mmin(z).sum
