n=gets.to_i
a=gets.split.map(&:to_i)

kh={}
a.uniq.sort.reverse_each.with_index{|v,i|
    kh[v]=i
}

ans=[0]*n
a.each{|ai|
    ans[kh[ai]]+=1
}
puts ans