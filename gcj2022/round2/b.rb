def filled r
    bmp = (0..r).map{[false]*(r+1)}
    (0..r).each{|x|
        (0..r).each{|y|
            bmp[x][y]=true if ((x*x+y*y)**0.5).round <= r
        }    
    }
    bmp
end

def wrong r
    bmp = (0..r).map{[false]*(r+1)}
    (0..r).each{|x|
        perim x,bmp
    }
    bmp
end

def perim r,bmp
    (0..r).each{|x|
        y = ((r*r-x*x)**0.5).round
        bmp[x][y] = true
        bmp[y][x] = true
    }
end

def check r,bmp
    ans = 0
    (0..r).each{|x|
        (0..r).each{|y|
            ans += 1 if (bmp[x][y]==false) && (((x*x+y*y)**0.5).round <= r)
        }    
    }
    ans
end

def perim2 r,bmp
    cnt = 0
    (0..r).each{|x|
        y = ((r*r-x*x)**0.5).round
        bmp[x][y] = true
        bmp[y][x] = true
        if x>0 && bmp[x-1][y]==false
            cnt += 1
            bmp[x-1][y]=true
        end
        if y>0 && bmp[x][y-1]==false
            cnt += 1
            bmp[x][y-1]=true
        end
        if y>0 && bmp[y-1][x]==false
            cnt += 1
            bmp[y-1][x]=true
        end
        if x>0 && bmp[y][x-1]==false
            cnt += 1
            bmp[y][x-1]=true
        end
    }
    cnt
end
max = 100
bmp = (0..max).map{[false]*(max+1)}
cnt = 0
ans2 = []
(0..max).each{|i|
    cnt += perim2 i,bmp
    ans2[i] = cnt
}
gets.to_i.times{|i|
    print "Case ##{i+1}: "
    r=gets.to_i

    b = wrong(r)
    ans = check(r,b)

    puts ans*4
    #puts ans2[r]*4
}
