n,x=gets.split.map(&:to_i)
a=gets.split.map(&:to_i).sort
left=x-a[1..n-3].sum
if left<=a[0]
    p 0
elsif left>a[n-2]
    p -1
else
    p left
end
