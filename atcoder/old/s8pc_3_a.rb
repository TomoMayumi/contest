n,k=gets.split.map(&:to_i)

div,mod = (n-1).divmod(11)
ans = div*5
ans += (n-mod..n-2).flat_map{|i|
  (2..6).map{|j|
    (i*7+j)*9%11
  }
}.count(k)
p ans