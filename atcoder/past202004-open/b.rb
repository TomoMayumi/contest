puts gets.chomp.chars.group_by{|s|s}.max_by{|k,v|v.size}[0]