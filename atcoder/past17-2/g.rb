H,W=gets.split.map(&:to_i)
G=(1..H).map{gets.chomp}
n=gets.to_i
s=gets.chomp.chars

def dfs(x,y,s)
    head,*tail=s
#    p [x,y,s]
    return true unless head
    return false if G[y][x]!=head
    tmpg = G[y][x]
    G[y][x] = " "
    ret=([0,x-1].max..[W-1,x+1].min).any?{|xi|
        ([0,y-1].max..[H-1,y+1].min).any?{|yi|
            dfs(xi,yi,tail)
        }
    }
    G[y][x] = tmpg
    return ret
end

puts (0...H).any?{|yi|(0...W).any?{|xi|dfs(xi,yi,s)}}?"Yes":"No"