# 最大公約数（GCD）を計算する関数
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

# 最小公倍数（LCM）を計算する関数
# Yを超える場合はY+1を返す
def lcm(a, b, y)
  return y + 1 if a == 0 || b == 0
  
  # オーバーフロー対策のため、bを先にgcdで割る
  res = a / gcd(a, b)
  # Yを超えるかチェック
  return y + 1 if res > y / b

  res * b
end

# 組み合わせ（C(n, k)）を計算する関数
def combinations(n, k)
  return 1 if k == 0 || n == k
  return 0 if k > n
  
  res = 1
  for i in 1..k
    res = res * (n - i + 1) / i
  end
  res
end

# 入力
N, M, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# f[k] = 少なくとも k 種類のセミが大量発生する年の数
f = Array.new(N + 1, 0)

# 全セミの組み合わせをビットマスクで走査
# 1 から 2^N - 1 までの範囲
(1...(1 << N)).each do |i|
  current_lcm = 1
  count = 0 # 部分集合の要素数
  
  (0...N).each do |j|
    if (i >> j) & 1 == 1
      count += 1
      # LCMを計算し、Yを超えたらループを抜ける
      current_lcm = lcm(current_lcm, A[j], Y)
      break if current_lcm > Y
    end
  end

  # LCMがY以下の場合
  if current_lcm <= Y
    # f[count]に加算
    f[count] += (Y / current_lcm)
  end
end

# g[M] = ちょうど M 種類のセミが大量発生する年の数
ans = 0

# 包除原理の式を計算
# g(M) = sum_{k=M to N} (-1)^(k-M) * C(k, M) * f(k)
(M..N).each do |k|
  term = combinations(k, M) * f[k]
  if (k - M).odd?
    ans -= term
  else
    ans += term
  end
end

puts ans
