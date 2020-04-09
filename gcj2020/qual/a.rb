(1..gets.to_i).each{|i|
  n=gets.to_i
  m=(1..n).map{gets.split.map(&:to_i)}
  k=(0...n).map{|ni|m[ni][ni]}.inject(:+)
  r=m.count{|mi|mi.sort!=mi.sort.uniq}
  c=m.transpose.count{|mi|mi.sort!=mi.sort.uniq}
  puts "Case ##{i}: #{k} #{r} #{c}"
}
