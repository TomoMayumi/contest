a,b,c,x=gets.split.map(&:to_i)
case
when x<=a
    p 1
when x<=b
    p c*1.0/(b-a)
else
    p 0
end
