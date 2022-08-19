h,w=gets.split.map(&:to_i)
a=(1..h).map{gets.split.map(&:to_i)}
ret = "Yes"
h.times{|i1|
w.times{|j1|
(i1..h-1).each{|i2|
(j1..w-1).each{|j2|
ret = "No" unless a[i1][j1]+a[i2][j2]<=a[i2][j1]+a[i1][j2]
}
}
}
}
puts ret