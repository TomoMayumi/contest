class BIT
  def initialize(size)
    @n = size
    @bit = Array.new(@n + 2, 0)
  end

  # 位置 i に値 x を加算する
  def add(i, x)
    while i <= @n
      @bit[i] += x
      i += i & -i
    end
  end

  # 1 から i までの和を求める
  def sum(i)
    s = 0
    while i > 0
      s += @bit[i]
      i -= i & -i
    end
    s
  end

  # k 番目の空き位置を見つける（1-indexed）
  def find_kth(k)
    idx = 0
    bit_mask = 1 << (@n.bit_length - 1)
    while bit_mask > 0
      t_idx = idx + bit_mask
      if t_idx <= @n && @bit[t_idx] < k
        k -= @bit[t_idx]
        idx = t_idx
      end
      bit_mask >>= 1
    end
    idx + 1
  end
end

n = gets.to_i
p_list = gets.split.map(&:to_i)

bit = BIT.new(n)

# 初期化：全ての位置を空きとして 1 を加算
(1..n).each do |i|
  bit.add(i, 1)
end

result = Array.new(n + 1)  # 1-indexed に合わせるため

(1..n).each do |i|
  p_i = p_list[i - 1]
  pos = bit.find_kth(p_i)
  result[pos] = i
  bit.add(pos, -1)  # 位置 pos を埋める
end

puts result[1..n].join(' ')
