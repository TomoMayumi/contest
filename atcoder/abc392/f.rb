class SegmentTree
  attr_reader :n, :size, :tree

  def initialize(n)
    @n = n
    @size = 1
    @size <<= 1 while @size < n
    @tree = Array.new(2 * @size, 0)
    build(1, 1, @n)
  end

  def build(node, l, r)
    if l == r
      @tree[node] = 1  # 各位置は初期状態では空いている
    else
      mid = (l + r) / 2
      build(node * 2, l, mid)
      build(node * 2 + 1, mid + 1, r)
      @tree[node] = @tree[node * 2] + @tree[node * 2 + 1]
    end
  end

  # k 番目の空き位置を見つける
  def query(node, l, r, k)
    return l if l == r

    mid = (l + r) / 2
    if @tree[node * 2] >= k
      query(node * 2, l, mid, k)
    else
      query(node * 2 + 1, mid + 1, r, k - @tree[node * 2])
    end
  end

  # 位置 pos を更新（埋める）
  def update(node, l, r, pos)
    @tree[node] -= 1  # 空き位置のカウントをデクリメント

    return if l == r  # 葉ノードの場合、終了

    mid = (l + r) / 2
    if pos <= mid
      update(node * 2, l, mid, pos)
    else
      update(node * 2 + 1, mid + 1, r, pos)
    end
  end
end

n = gets.to_i
p_list = gets.split.map(&:to_i)

seg_tree = SegmentTree.new(n)
result = []

n.downto(1){|i|
  p_i = p_list[i - 1]
  pos = seg_tree.query(1, 1, seg_tree.n, p_i)
  seg_tree.update(1, 1, seg_tree.n, pos)
  result[pos] = i
}

puts result[1..n]*" "
