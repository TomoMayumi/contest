s=gets.chomp
s.sub!(/\(([a-z]*)\)/){$1+$1.reverse} while s=~/\(/
puts s