x,y,z=gets.split.map(&:to_i)
if x<0
    x*=-1
    y*=-1
    z*=-1
end

if y<0 || x<y
    p x
elsif y<z
    p -1
elsif z<0
    p -z*2+x
else
    p x
end
