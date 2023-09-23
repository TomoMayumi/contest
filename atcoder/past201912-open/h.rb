class BinaryHeap
    def initialize(n = 0)
        @node = Array.new(n)
        @count = 0
    end

    def push(v)
        @count += 1
        i = @count
        while i > 1
            parent_i = i / 2
            parent = @node[parent_i]
            break if parent[0] <= v[0]
            @node[i] = parent
            @node[i][2] = i
            i = parent_i
        end
        @node[i] = v
        @node[i][2] = i
    end

    def update(i)
        current = @node[i]
        while i > 1
            parent_i = i / 2
            parent = @node[parent_i]
            break if parent[0] <= current[0]
            @node[i] = parent
            @node[i][2] = i
            i = parent_i
        end
        @node[i] = current
        @node[i][2] = i
    end

    def min
        @node[1]||[1e20]
    end
end

odd = BinaryHeap.new
even = BinaryHeap.new

n=gets.to_i
l=gets.split.map.with_index(1){|s, i|[s.to_i, i]}
l.each{|a|
    if a[1].even?
        even.push a
    else
        odd.push a
    end
}
solocnt = 0
evencnt = 0
oddcnt = 0

gets.to_i.times{
    s,a,b=gets.split.map(&:to_i)
    case s
    when 1
        if a.even?
            if l[a-1][0]-evencnt>=b
                l[a-1][0]-=b
                solocnt+=b
                even.update(l[a-1][2])
            end
        else
            if l[a-1][0]-oddcnt>=b
                l[a-1][0]-=b
                solocnt+=b
                odd.update(l[a-1][2])
            end
        end
    when 2
        if odd.min[0]-oddcnt>=a
            oddcnt+=a
        end
    when 3
        if odd.min[0]-oddcnt>=a && even.min[0]-evencnt>=a
            oddcnt+=a
            evencnt+=a
        end
    end
}

p solocnt + evencnt*(n/2) + oddcnt*((n+1)/2)