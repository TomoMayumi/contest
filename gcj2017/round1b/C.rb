gets.to_i.times{|t|
  n,q = gets.split.map(&:to_i)
  horse = [0]+(1..n).map{gets.split.map(&:to_i)}
  dist = [0]+(1..n).map{[0]+gets.split.map(&:to_i)}
  tar = (1..q).map{gets.split.map(&:to_i)}

  result = tar

  puts "Case ##{t+1}: #{result}"
}
