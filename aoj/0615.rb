def dfs(left)
  $memo[left] ||= case left.size
  when 0
    0
  when 1
    left[0]
  else
    [[left[0],left[1..-1]],[left[-1],left[0..-2]]].map{|x,l|
      if l[0] > l[-1]
        l.shift
      else
        l.pop
      end
      x + dfs(l)
    }.max
  end
end

$memo = {}
n = gets.to_i
a = (1..n).map{gets.to_i}

p (1..n).map{|i|dfs(a.rotate(i))}.max
