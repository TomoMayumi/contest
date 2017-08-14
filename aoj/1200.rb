require 'prime'
while (n=gets.to_i)>0
  p Prime.each(n/2).count{|i|(n-i).prime?}
end