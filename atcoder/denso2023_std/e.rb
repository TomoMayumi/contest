def dfs(l,ans)
    return ans if l==[]
    z=l.pop
    (l.size-1).downto(0){|i|
        break if l[i]*2<z
        ll=l.dup
        y=ll.delete_at(i)
        if idx=ll.index(z-y)
            x=ll.delete_at(idx)
            if ret = dfs(ll,ans+[[x,y,z]])
                return ret
            end
        end
    }
    return false
end

n=gets.to_i
a=gets.split.map(&:to_i).sort

ans=dfs(a,[])
puts ans ? "Yes\n"+ans.map{|a|a*" "}*"\n" : "No"
