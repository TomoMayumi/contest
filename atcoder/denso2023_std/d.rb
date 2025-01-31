n,m=gets.split.map(&:to_i)
ab=(1..m).map{gets.split.map(&:to_i)}
puts [0,1,2].repeated_permutation(n).any?{|l|
    ab.all?{|a,b|l[a-1]!=l[b-1]}
} ? "Yes" : "No"
