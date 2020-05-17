(1..gets.to_i).each{|i|
  l,r=gets.split.map(&:to_i)
  n=1
  while true
    if l>=r
      break if l<n
      l-=n
    else
      break if r<n
      r-=n
    end
    n+=1
  end
  puts "Case ##{i}: #{n-1} #{l} #{r}"
}
