s=gets.chomp
p (?a..?z).map{|c|s.scan(/[^#{c}]+/).map(&:size).max||0}.min