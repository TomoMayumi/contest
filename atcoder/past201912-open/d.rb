n=gets.to_i
cnt = [1]+[0]*n
$<.each{|s|
    cnt[s.to_i]+=1
}
a=cnt.find_index(2)
b=cnt.find_index(0)
if a
    puts "#{a} #{b}"
else
    puts "Correct"
end
