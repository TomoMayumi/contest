n=gets.to_i
a=[0]+gets.split.map(&:to_i)
neib=(0..n).map{[]}
(n-1).times{
    u,v=gets.split.map(&:to_i)
    neib[u] << v
    neib[v] << u
}

def f(neib,target,parent,a)
    odd=0
    even=0
    first=true
    neib[target].each{|i|
        next if i==parent
        o,e=f(neib,i,target,a)
        if first
            odd,even = o,e
            first = false
        else
            odd,even = [odd+e,even+o].max,[odd+o,even+e].max
        end
    }
    if a[target]==1
        even+=1
    else
        odd+=1
    end
    return [odd,even]
end

p f(neib,1,0,a).max