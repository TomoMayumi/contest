gets
a=gets.split.map(&:to_i)
maxa=a.max
puts a.map{|i|(1e9*i/maxa).round}*" "