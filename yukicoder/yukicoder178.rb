gets
m=p

p ($<.inject(x=i=0){|s,l|
a,b=l.split
t=a.to_i+4*b.to_i
m&&m!=t%2&&break
m=t%2
u=x-t
i+=1
x<t ?(x=t;s+u-u*i):s+u
}||-2)/2
