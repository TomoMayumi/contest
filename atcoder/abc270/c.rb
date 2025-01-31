n,x,y=gets.split.map(&:to_i)
neib=(0..n).map{[]}
(n-1).times{
    u,v=gets.split.map(&:to_i)
    neib[u]<<v
    neib[v]<<u
}

def dfs(pre,target,goal,neib,list)
    list.push(target)
    if target==goal
        return list
    end
    ret=nil
    neib[target].each{|n|
        next if n==pre
        r=dfs(target,n,goal,neib,list)
        if r
            ret=r
            break
        end
    }
    unless ret
        list.pop
    end
    return ret
end

puts dfs(0,x,y,neib,[])*" "
