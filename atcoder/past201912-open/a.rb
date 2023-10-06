s = gets
puts s =~ /^\d{3}$/ ? s.to_i*2 : "error"
