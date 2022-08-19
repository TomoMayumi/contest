n=gets.to_i
a=[0]+[1]*9+[0]
(n-1).times{
    b=[0]
    a.each_cons(3){|x|b<<x.sum%998244353}
    b<<0
    a=b
}
p a.sum%998244353
