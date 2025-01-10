N=gets.to_i
PARENT=[0,0]+gets.split.map(&:to_i)
V=[0]+gets.chomp.split
M=998244353

CHILDREN=(0..N).map{[]}
PARENT.each.with_index{|pare,idx|
    CHILDREN[pare]<<idx
}

def dfs(idx)
    if CHILDREN[idx]==[]
        V[idx].to_i
    else
        CHILDREN[idx].inject{|a,b|
            va=dfs(a)
            vb=dfs(b)
            case V[idx]
            when "+"
                (va+vb)%M
            else
                (va*vb)%M
            end
        }
    end
end

p dfs(1)