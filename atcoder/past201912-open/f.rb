puts gets.chomp.scan(/[A-Z][a-z]*[A-Z]/).map(&:downcase).sort.map{|s|
    s[0]  = s[0].upcase
    s[-1] = s[-1].upcase
    s
}*""