gets.to_i.times{|i|
    print "Case ##{i+1}: "
    gets
    s = gets.split.map(&:to_i).sort
    i = 0
    i += 1 if s.shift >= i+1 while s[0]
    puts i
}
