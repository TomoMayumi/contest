n=rand(1..1000)
p n
n.times{
  x=rand(0..10000)
  y=rand(-10000..10000)
  r=rand(0..10000)
  puts [x,y,r]*" "
}