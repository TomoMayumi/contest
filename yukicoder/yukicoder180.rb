gets
T=$<.map &:split
f=->w{n=T.map{|a,b|a.to_i+b.to_i*w};n.max-n.min}
p (1..1<<30).bsearch{|i|f[i]<=f[i+1]}