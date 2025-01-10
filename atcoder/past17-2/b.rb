gets
s=$<.map(&:chomp)
ans = if s.all?("Perfect")
    "All Perfect"
elsif s.all?{|si|["Perfect","Great"].include?(si)}
    "Full Combo"
else
    "Failed"
end
puts ans
