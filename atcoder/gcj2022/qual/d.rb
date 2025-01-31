gets.to_i.times{|i|
    print "Case ##{i+1}: "
    n = gets.to_i
    f = gets.split.map(&:to_i)
    parent = gets.split.map(&:to_i).map(&:pred)
    child = (0...n).map{[]}
    parent.each.with_index{|pa,i|
        child[pa] << i if pa >= 0
    }
    max = []
    visited = []
    ans = 0
    q = (0...n).select{|i|parent[i]==-1}
    while q[0]
        if visited[q[-1]]
            tq = q.pop
            t,*childs = child[tq].map{|c|max[c]}.sort
            ans += childs.sum if childs[0]
            max[tq] = [t||0,f[tq]].max
        else
            tq = q[-1]
            visited[tq] = true
            child[tq].each{|c|q << c}
        end
    end

    ans += (0..n).select{|i|parent[i]==-1}.sum{|i|max[i]}

    puts ans
}
