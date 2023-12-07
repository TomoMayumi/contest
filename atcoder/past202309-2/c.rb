gets
a=gets.split.map(&:to_i)
p (1..8).map{|i|a.count(i)}.min