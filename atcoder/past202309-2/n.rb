mod=998244353
q,k=gets.split.map(&:to_i)
klist = [1]
ktmp = k
(1..300000).each{|i|
    klist << ktmp
    ktmp = (ktmp*k)%mod
}
list=[]
q.times{
    op,v=gets.split
    v=v.to_i
    case op
    when '+'
        list.insert(list.bsearch_index{|i|i>v}||-1,v)
    when '-'
        list.delete_at(list.bsearch_index{|i|i>=v})
    end
    sum=0
    list.zip(klist){|li,ki|
        sum = (sum + li*ki%mod) % mod
    }
    p sum
}