k=gets.to_i-1
a=[1,2,3,4,5,6,7,8,9]
until a[k]
    k-=a.size
    a=a.flat_map{|i|(0...i%10).map{|j|i*10+j}}
end
p a[k]