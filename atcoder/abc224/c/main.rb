n=gets.to_i
l=(1..n).map{gets.split.map(&:to_i)}

p l.combination(3).count{|(x1,y1),(x2,y2),(x3,y3)|
    (x2-x1)*(y3-y1)-(x3-x1)*(y2-y1) != 0
}