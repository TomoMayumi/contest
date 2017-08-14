UF=Hash.new{-1}
def u a,b;UF[f b]=f a;end
def f c;UF[c]<0?c:UF[c]=f(UF[c])end

cities=(1..n=gets.to_i).map{|i|gets.split.map(&:to_i)+[i]}

road = cities.sort_by{|x,y,i|x}.each_cons(2).map{|(x1,y1,i),(x2,y2,j)|[x2-x1,i,j]}+
       cities.sort_by{|x,y,i|y}.each_cons(2).map{|(x1,y1,i),(x2,y2,j)|[y2-y1,i,j]}

p road.sort.inject(0){|s,(cost,i,j)|
  if f(i)!=f(j)
    u(i,j)
    s+cost
  else
    s
  end
}
