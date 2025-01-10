x=gets.to_i
p [*1..9].product([*1..9]).map{|i,j|i*j}.select{|i|i!=x}.inject(:+)
