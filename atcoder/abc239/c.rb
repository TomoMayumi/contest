a,b,c,d=gets.split.map(&:to_i)

ab,cd=[[a,b],[c,d]].map{|i,j|
    [
        [i+1,j+2],
        [i+2,j+1],
        [i+2,j-1],
        [i+1,j-2],
        [i-1,j-2],
        [i-2,j-1],
        [i-2,j+1],
        [i-1,j+2],
    ]
}
puts (ab & cd)[0] ? "Yes" : "No"