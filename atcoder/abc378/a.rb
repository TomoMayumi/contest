a,b,c,d=gets.split.map(&:to_i).sort
p (if a==d
  2
elsif a==c
  1
elsif a==b
  if c==d
    2
  else
    1
  end
else
  if b==d
    1
  elsif b==c
    1
  else
    if c==d
      1
    else
      0
    end
  end
end
)