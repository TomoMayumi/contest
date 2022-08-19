gets
a=gets.split.map(&:to_i)
b=gets.split.map(&:to_i)

puts b.all?{|i|
    (idx=a.index(i)) && a.delete_at(idx)
} ? "Yes" : "No"
