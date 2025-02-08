class UnionFindWithWeight
  attr_accessor :root,:weig
  def initialize(size)
    @root = Array.new(size, -1)
    @weig = Array.new(size, 0)
  end

  # @weig[y] - @weig[x] = w になるように併合 
  def unite(x, y, w)
    x_root = find(x)
    y_root = find(y)
    return false if x_root == y_root

    w += @weig[x]
    w -= @weig[y]

    if @root[x_root] > @root[y_root]
      y_root,x_root = x_root,y_root
      w = -w
    end
    @root[x_root] += @root[y_root]
    @root[y_root] = x_root
    @weig[y_root] = w
    return true
  end

  def find(x)
    if @root[x] < 0
      x
    else
      x_root = find(@root[x])
      @weig[x] += @weig[@root[x]]
      @root[x] = x_root
    end
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

  def weight(x)
    find(x)
    @weig[x]
  end

  def diff(x,y)
    weight(y) - weight(x)
  end

  def to_s
    "<#{self.class}: @root=#{@root} @weig=#{@weig}>"
  end
end
