n,m=gets.split.map(&:to_i)
a=gets.split.map(&:to_i)

ans = [*1..n]-a
p ans.size
puts ans*" "