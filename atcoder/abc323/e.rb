mod=998244353
n,x=gets.split.map(&:to_i)
t=gets.split.map(&:to_i)
inv_n = n.pow(mod-2,mod)
u=[1]+[0]*x
(0...x).each{|i|
    next if u[i]==0
    t.each{|ti|
        u[i+ti] += u[i] * inv_n % mod if i+ti <= x
    }
}
p u[[x-t[0]+1,0].max..x].sum * inv_n % mod