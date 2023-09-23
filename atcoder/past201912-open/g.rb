n=gets.to_i
tbl=(1...n).map{|i|
    [nil]*(i)+gets.split.map(&:to_i)
}
p [1,2,3].repeated_combination(n).map{|a|
    (0...n).group_by{|i|a[i]}.sum{|v,l|
        l.combination(2).sum{|x,y|tbl[x][y]}
    }
}.max
#WA