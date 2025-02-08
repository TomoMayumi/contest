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

  def group(x)
    x_root = find(x)
    (0..@root.size-1).select{|i|find(i)==x_root}
  end

  def groups
    (0..@root.size-1).group_by{|i|find(i)}.values
  end

  def to_s
    "<#{self.class}: @root=#{@root}>"
  end
end

if __FILE__ == $0
  def assert(exp);exp||throw(exp);end
  uf = UnionFind.new(10)

  assert(uf.unite(2,3))
  assert(uf.unite(3,4))
  assert(uf.unite(6,8))
  assert(uf.unite(0,9))
  assert(uf.unite(2,4)==false)
  assert(uf.unite(5,5)==false)

  assert(uf.same?(0,0))
  assert(uf.same?(2,4))
  assert(uf.same?(6,8))
  assert(uf.same?(1,8)==false)
  assert(uf.same?(6,9)==false)

  assert(uf.groups==[[0,9],[1],[2,3,4],[5],[6,8],[7]])
  assert(uf.group(6)==[6,8])

  assert(uf.unite(0,8))
  assert(uf.same?(6,9))

  assert(uf.groups==[[0,6,8,9],[1],[2,3,4],[5],[7]])
  assert(uf.group(6)==[0,6,8,9])

  assert(uf.size(6)==4)
  assert(uf.size(1)==1)
end