s=gets.chomp
sum=s.chars.uniq.size+1
if s.size>=2
    sum+=s.chars.each_cons(2).flat_map{|ss|
        ss=ss*""
        [ss,?.+ss[1],ss[0]+?.]
    }.uniq.size+1
end
if s.size>=3
    sum+=s.chars.each_cons(3).flat_map{|ss|
        ss=ss*""
        [ss,?.+ss[1,2],ss[0]+?.+ss[2],ss[0,2]+?.,ss[0]+"..",?.+ss[1]+?.,".."+ss[2]]
    }.uniq.size+1
end
p sum