gets
p gets.split.map(&:to_i).minmax.inject{|s,r|r-s}