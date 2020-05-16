n,x=gets.split.map(&:to_i)
a=$<.map(&:to_i)
if a.all?{|i|i>x}
  raise
end

p n.downto(0).map{|i|
    a.combination(i).map{|i|x-(i.inject(:+)||0)}.select{|i|i>=0}.min
}.compact.first