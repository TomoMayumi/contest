N=gets.to_i
A=gets.split.map(&:to_i)

def check(x,y,z)
    x,y,z=A[x],A[y],A[z]
    return (x+y>z && y+z>x && z+x>y)
end

def dfs(left)
    return 1 if left==[]
    return left.combination(3).select{|x,y,z|check(x,y,z)}.sum{|xyz|dfs(left-xyz)}
end


left=[*0...3*N]
p dfs(left)/(1..N).inject(:*)

__END__

def main
    n=gets.to_i
    a=gets.split.map(&:to_i).sort

    p dfs(a)
end

def dfs(left)
    p left
    return 1 if left==[]
    ret=0
    z=left.pop
    left.combination(2).uniq.each{|x,y|
        next unless (x+y>z && y+z>x && z+x>y)
        p [[x,y,z]]
        ll=left.dup
        ll.delete_at(ll.index(x))
        ll.delete_at(ll.index(y))
        ret += dfs(ll)
    }
    return ret
end

main
__END__

