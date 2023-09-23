n,m=gets.split.map(&:to_i)
l = m.times.map{
    s,c=gets.split
    si=s.chars.map.with_index{|c,i|c==?Y ? 2**i : 0}.sum
    [si,c.to_i]
}
bitl = (0...n).map{|i|
    l.select{|si,c|si[i]==1}
}
$memo = []
def dfs(n,bit,bitl)
    return $memo[n] if $memo[n]
    return 0 if bit<0
    if n[bit]==0
        return $memo[n] = bitl[bit].map{|si,c|c+dfs(n|si,bit-1,bitl)}.min
    else
        return $memo[n] = dfs(n,bit-1,bitl)
    end
end

p dfs(0,n-1,bitl)||-1