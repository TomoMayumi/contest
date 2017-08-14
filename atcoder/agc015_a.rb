n,a,b=gets.split.map(&:to_i)

if a>b || n==0 || (n==1 && a<b)
  p 0
else
  p (b-a)*(n-2)+1
end