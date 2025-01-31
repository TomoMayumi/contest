class UnionFind
  attr_accessor :root
  def initialize(size)
    @root = Array.new(size, -1)
  end

  def unite(x, y)
    x_root = find(x)
    y_root = find(y)
    return false if x_root == y_root

    if @root[x_root] > @root[y_root]
      y_root,x_root = x_root,y_root
    end
    @root[x_root] += @root[y_root]
    @root[y_root] = x_root
    return true
  end

  def find(x)
    @root[x] < 0 ? x : (@root[x] = find(@root[x]))
  end

  def same?(x, y)
    find(x) == find(y)
  end
  def size(x)
    -root[find(x)]
  end

  def groups
    (0..@root.size-1).group_by{|i|find(i)}.values
  end

  def to_s
    "<#{self.class}: @root=#{@root}>"
  end
end

class UnionFindEdit < UnionFind
  def initialize(size)
    super(size)
    @stack = []
  end
  def push
    @stack.push self.root.dup
  end
  def pop
    self.root = @stack.pop
  end
end

def dfs(edges,cnt,uf,cost)
  return cost if cnt==0
  return K if cnt>edges.size

  (u,v,w),*left = edges

  ret = []
  uf.push
  ret << dfs(left,cnt-1,uf,(cost+w)%K) if uf.unite(u-1,v-1)
  uf.pop
  ret << dfs(left,cnt,uf,cost)

  ret.min
end

N,M,K=gets.split.map(&:to_i)
edges=(1..M).map{gets.split.map(&:to_i)}

p dfs(edges,N-1,UnionFindEdit.new(N),0)

__END__
# こっちでも通る
n,m,k=gets.split.map(&:to_i)
edges=(1..m).map{gets.split.map(&:to_i)}
p edges.combination(n-1).select{|es|
    uf=UnionFind.new(n)
    es.all?{|u,v,w|
        uf.unite(u-1,v-1)
    }
}.map{|es|
    es.inject(0){|s,(u,v,w)|
        (s+w)%k
    }
}.min