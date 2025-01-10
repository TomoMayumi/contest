a,b,c=gets.split.map(&:to_i)
x=gets.split.map(&:to_i)

as=x.sum{|xi|[0,xi-3].max*a}
bs=b+x.sum{|xi|[0,xi-50].max*a}
cs=c

p [as,bs,cs].min