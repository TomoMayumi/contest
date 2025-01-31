n,q=gets.split.map(&:to_i)
l=(1..n).map{gets.split.map(&:to_i)}
q.times{
    s,t=gets.split.map(&:to_i)
    p l[s-1][t]
}