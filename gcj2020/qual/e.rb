(1..gets.to_i).each{|no|
  n,k=gets.split.map(&:to_i)
  ans = if n.odd? && (1..n).inject(:+)==k
    ["POSSIBLE1"]+(0...n).map{|i|[*1..n].rotate(i)*" "}
  elsif n.even? && (1..n).step(2).inject(:+)*2==k
    ["POSSIBLE2"]+(0...n).map{|i|[*1..n].rotate(i)*" "}
  elsif n.even? && (2..n).step(2).inject(:+)*2==k
    ["POSSIBLE3"]+(1..n).map{|i|[*1..n].rotate(i)*" "}
  elsif k%n==0
    s=k/n
    ["POSSIBLE4"]+(n-(s-1)..2*n-(s-1)-1).map{|i|[*1..n].rotate(-i)*" "}
  else
    ["IMPOSSIBLE"]
  end * ?\n
  puts "Case ##{no}: #{ans}"
}
