class UnionFind
  def initialize(n)
    @parent = (0..n).to_a
    @rank = Array.new(n+1, 0)
  end

  def find(x)
    if @parent[x] != x
      @parent[x] = find(@parent[x])
    end
    @parent[x]
  end

  def union(x, y)
    xroot = find(x)
    yroot = find(y)
    return false if xroot == yroot

    if @rank[xroot] < @rank[yroot]
      @parent[xroot] = yroot
    else
      @parent[yroot] = xroot
      @rank[xroot] += 1 if @rank[xroot] == @rank[yroot]
    end
    return true
  end

  def same?(x, y)
    find(x) == find(y)
  end
end

n,m=gets.split.map(&:to_i)
edges=(1..m).map{|i|
  [i,*gets.split.map(&:to_i)]
}

uf = UnionFind.new(n)
redundant_edges = []
edges.each{|idx,u,v|
  redundant_edges << [idx,u,v] if !uf.union(u,v)
}

roots=[]
(1..n).each{|v|
  roots << v if uf.find(v) == v
}

p k=roots.size-1
puts redundant_edges[0,k].map.with_index(1){|(idx,u,v),i|
  if uf.find(u)!=uf.find(roots[i])
    uf.union(u,roots[i])
    [idx,u,roots[i]]*" "
  elsif uf.find(v)!=uf.find(roots[i])
    uf.union(v,roots[i])
    [idx,v,roots[i]]*" "
  else
    uf.union(u,roots[0])
    [idx,u,roots[0]]*" "
  end
}
