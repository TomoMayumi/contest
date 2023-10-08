ax,ay,bx,by,cx,cy=gets.split.map(&:to_i)

start = []
if bx==cx
elsif bx<cx
    start << [bx-1,by]
else
    start << [bx+1,by]
end
if by==cy
elsif by<cy
    start << [bx,by-1]
else
    start << [bx,by+1]
end
p start.map{|sx,sy|
    ans = (sx-ax).abs + (sy-ay).abs
    if sx==ax && ax==bx && sy!=ay && ((sy < by && by < ay)||(sy > by && by > ay))
        ans += 2
    end
    if sy==ay && ay==by && sx!=ax && ((sx < bx && bx < ax)||(sx > bx && bx > ax))
        ans += 2
    end
    ans += (cx-bx).abs + (cy-by).abs
    if cx!=bx && cy!=by
        ans += 2
    end
    ans
}.min
