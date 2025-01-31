n,m=gets.split.map(&:to_i)
t=(1..n).map{|i|([true]+[false]*(n-1)).rotate(-i+1)}
m.times{
    k,*x=gets.split.map(&:to_i)
    x.combination(2){|i,j|
        t[i-1][j-1]=t[j-1][i-1]=true
    }
}
puts t.all?{|ti|ti.all?} ? "Yes" : "No"