n,q=gets.split.map(&:to_i)
x=[0]+gets.split.map(&:to_i)

neighber = (0..n).map{[]}
(n-1).times{
    a,b = gets.split.map(&:to_i)
    neighber[a] << b
    neighber[b] << a
}

depth = [nil,0]
children = [nil,neighber[1]]

parents = [1]
while parent = parents.pop
    children[parent].each{|c|
        children[c] = neighber[c]-[parent]
        parents.push(c)
        depth[c] = depth[parent]+1
    }
end

sorted = []
(1..n).group_by{|i|depth[i]}.sort.reverse_each{|d,l|
    l.each{|j|
        sorted[j] = (children[j].flat_map{|k|sorted[k]}+[x[j]]).sort.reverse.take(20)
    }
}

q.times{
    v,k = gets.split.map(&:to_i)
    p sorted[v][k-1]
}
