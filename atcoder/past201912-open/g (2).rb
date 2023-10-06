n=gets.to_i
tbl=(1...n).map{|i|
    [0]*(i)+gets.split.map(&:to_i)
}
p [1,2,3].repeated_combination(n).map{|a|
    (0...n).group_by{|i|a[i]}.map{|v,l|
        l.combination(2).map{|pair|
            x,y=pair.sort
            tbl[x][y]
        }.sum
    }.sum
}.max
