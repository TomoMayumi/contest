n=gets.to_i
s=(1..n).map{gets.chomp}

sy=s.index{|si|si.include?('S')}
sx=s[sy].index('S')
s[sy][sx]='.'

gy=s.index{|si|si.include?('G')}
gx=s[gy].index('G')
s[gy][gx]='.'

up=(0...n).map{[0]*n}
(1...n).each{|y|
    upy=(0...n).map{|x|s[y-1][x]=='.' ? up[y-1][x]+1 : 0}
    up[y] = upy
}
down=(0...n).map{[0]*n}
(n-2).downto(0).each{|y|
    downy=(0...n).map{|x|s[y+1][x]=='.' ? down[y+1][x]+1 : 0}
    down[y] = downy
}
right=(0...n).map{[0]*n}
(n-2).downto(0).each{|x|
    (0...n).each{|y|
        right[y][x] = right[y][x+1]+1 if s[y][x+1]=='.'
    }
}
left=(0...n).map{[0]*n}
(1...n).each{|x|
    (0...n).each{|y|
        left[y][x] = left[y][x-1]+1 if s[y][x-1]=='.'
    }
}

(1...n).each{|k|
    q=[[sx,sy]]
    steplist=(0...n).map{[]}
    steplist[sy][sx]=0
    step=1
    while q[0]
        newq = []
        q.each{|x,y|
            if left[y][x] >= k && !steplist[y][x-k]
                newq << [x-k,y]
                steplist[y][x-k] = step
            end
            if up[y][x] >= k && !steplist[y-k][x]
                newq << [x,y-k]
                steplist[y-k][x] = step
            end
            if right[y][x] >= k && !steplist[y][x+k]
                newq << [x+k,y]
                steplist[y][x+k] = step
            end
            if down[y][x] >= k && !steplist[y+k][x]
                newq << [x,y+k]
                steplist[y+k][x] = step
            end
        }
        q=newq
        step+=1
    end
    p steplist[gy][gx]||-1
}

