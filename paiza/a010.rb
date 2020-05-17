n=gets.to_i
route=[]
(1..n).map{
  x,y,r=gets.split.map(&:to_i)
  if r>=y.abs
    dx=Math.sqrt(r*r-y*y)
    route << [x-dx,-1]
    route << [x+dx,1]
  end
}
max=0
now=0
route.sort.each{|x,d|
  now+=d
  max=-now if max<-now
}
p max