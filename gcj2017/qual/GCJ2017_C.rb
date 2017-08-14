t = gets.to_i

t.times{|pnum|
  n,k = gets.split.map(&:to_i)
  div = 2**(k.to_s(2).size-1)

  tgt = (n-div+1)/div
  if (n-div+1)%div > (k-div)
    tgt += 1
  end

  min = (tgt-1)/2
  max = min + (tgt-1)%2

  puts "Case ##{pnum+1}: #{max} #{min}"
}
