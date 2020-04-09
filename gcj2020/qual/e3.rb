(1..gets.to_i).each{|no|
  n,k=gets.split.map(&:to_i)
  all = (1..n).map{|i|[*1..n].rotate(i)}
  ans=all.permutation.find{|a|(0...n).map{|i|a[i][i]}.inject(:+)==k}

  if ans
    ans = ["POSSIBLE",*ans.map{|a|a*" "}]*"\n"
  else
    ans = "IMPOSSIBLE"
  end
  puts "Case ##{no}: #{ans}"
}
