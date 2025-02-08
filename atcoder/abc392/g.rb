# 入力の読み込み
n, *rest = STDIN.read.split.map(&:to_i)
s = rest[0...n]

# Sの最大値を取得
max_value = s.max

# 畳み込みのための配列サイズを決定（2 * max_value以上の最小の2の累乗）
size = 1
size *= 2 while size <= 2 * max_value

# 畳み込みに使用する配列を初期化
arr = Array.new(size, 0)
s.each { |num| arr[num] = 1 }

# FFTと畳み込みの実装に必要な複素数を使用
require 'complex'

# ビット反転順序のインデックスを生成
def bit_reverse(n)
  rev = 0
  bits = n.bit_length - 1
  (0...n).map { |i|
    rev = (rev << 1) | (i >> bits) & 1 if i > 0
    bits -= 1
    rev
  }
end

# イテレーティブなFFTの実装
def fft(a, invert)
  n = a.size
  # ビット反転順序に並べ替え
  rev = bit_reverse(n)
  a = rev.map { |i| a[i] }

  len = 2
  while len <= n
    # 回転因子の計算
    ang = 2 * Math::PI / len * (invert ? -1 : 1)
    wlen = Complex(cos(ang), sin(ang))
    i = 0
    while i < n
      w = Complex(1, 0)
      (len / 2).times do |j|
        u = a[i + j]
        v = a[i + j + len / 2] * w
        a[i + j] = u + v
        a[i + j + len / 2] = u - v
        w *= wlen
      end
      i += len
    end
    len <<= 1
  end

  # 逆変換の場合は各要素を半分にする
  if invert
    a.map! { |x| x / n }
  end

  a
end

# 畳み込みを計算する関数
def convolve(a, b)
  n = 1
  n *= 2 while n < a.size + b.size
  # 配列をゼロでパディング
  a_pad = a + [0] * (n - a.size)
  b_pad = b + [0] * (n - b.size)
  # FFTを実行
  a_fft = fft(a_pad, false)
  b_fft = fft(b_pad, false)
  # 要素ごとに乗算
  c_fft = a_fft.zip(b_fft).map { |x, y| x * y }
  # 逆FFTを実行
  c = fft(c_fft, true)
  # 実数部を取り出し、小数点以下を四捨五入
  c.map { |val| val.real.round }
end

# 畳み込みを実行
conv = convolve(arr, arr)

# 良い三つ組の数をカウントする
count = 0

# 高速な要素の存在確認のためにセットを使用
require 'set'
s_set = s.to_set

# 可能なA+Cの値について全て調べる
(2..2 * max_value).each do |sum|
  # sumが偶数でなければ次へ
  next unless sum.even?
  b = sum / 2
  # Bが集合Sに存在するか確認
  next unless arr[b] > 0
  # 畳み込みの結果からA+C=sumとなる(A,C)の組の数を取得
  total_pairs = conv[sum]
  # A==Cの場合を調整（重複を避けるため）
  total_pairs -= arr[b] if sum == 2 * b
  # 順序付きの組(A,C)の数を得るために2で割る
  ordered_pairs = total_pairs / 2
  # カウントを加算
  count += ordered_pairs if ordered_pairs > 0
end

# 結果を出力
puts count
