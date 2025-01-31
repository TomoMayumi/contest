ans=""
gets.chars{|c|
  ans << c
  ans.delete_suffix!("ABC")
}
puts ans

__END__
s=gets.chomp
ans = ""
tmp = ""
s.chars.each{|c|
  case c
  when 'A'
    tmp << c
  when 'B'
    if tmp[-1]=='A'
      tmp << c
    else
      ans << tmp << c
      tmp=""
    end
  when 'C'
    if tmp[-1]=='B'
      tmp=tmp[0..-3]
    else
      ans << tmp << c
      tmp=""
    end
  end
}
puts ans+tmp