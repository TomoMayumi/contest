gets.to_i.times{|t|
  d,n = gets.split.map(&:to_i)
  horse = (1..n).map{gets.split.map(&:to_i)}

  result = d/horse.map{|k,s|(d-k+0.0)/s}.max

  puts "Case ##{t+1}: #{result}"
}
