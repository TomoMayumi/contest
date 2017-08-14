n=gets.to_i
a=gets.split.map(&:to_i).sort
x,y=a.take(n/2).zip(a.drop(n/2).reverse).map{|i,j|i+j}.minmax
p y-x
