n=gets.to_i
a=gets.split.map.with_index{|s,i|[s.to_i,i]}
ans=[]
(1..n-1).each{|i|
    a=a.each_slice(2).map{|(a,ai),(b,bi)|
        if a>b
            ans[bi]=i
            [a,ai]
        else
            ans[ai]=i
            [b,bi]
        end
    }
}
a.each{|a,ai|ans[ai]=n}
puts ans