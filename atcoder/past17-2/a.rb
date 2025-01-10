h,w = gets.split.map(&:to_f)
bmi = w/((h/100)**2)
ans = if bmi < 20
    "A"
elsif bmi < 25
    "B"
else
    "C"
end
puts ans