gets
s=gets.chomp

nest=0
s.chars.each{|c|
  if c=="("
    nest += 1
  else
    if nest>0
      nest-=1
    else
      s="("+s
    end
  end
}
puts s+(")"*nest)
