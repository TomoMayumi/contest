n,m=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)
(1..n).each{|i|
    p a[0]-i
    a.shift if a[0]==i
}
