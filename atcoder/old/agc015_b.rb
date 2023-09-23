s=gets.chomp

sum = 0
s.each_char.with_index{|c,i|
  case c
  when 'U'
    sum += s.size-i-1
    sum += i*2
  when 'D'
    sum += (s.size-i-1)*2
    sum += i
  end
}
p sum