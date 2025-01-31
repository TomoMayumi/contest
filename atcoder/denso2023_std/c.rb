n=gets.to_i
xy=(1..n).map{gets.split.map(&:to_i)}
puts xy.each_cons(2).all?{|(x,y),(u,v)|
    [[1,2],[2,1],[-1,2],[-2,1],[1,-2],[2,-1],[-1,-2],[-2,-1]].include?([u-x,v-y])    
} ? "Yes" : "No"