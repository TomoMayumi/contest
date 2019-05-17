gets.to_i.times{
  n,e=gets.split.map(&:to_i)
  (e-1).times{
    n = (n+1)/2-1
  }
  p n+(e-1)
}
