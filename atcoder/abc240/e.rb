n=gets.to_i

neighber = (0..n).map{[]}
(n-1).times{
    a,b = gets.split.map(&:to_i)
    neighber[a] << b
    neighber[b] << a
}

$children = [nil,neighber[1]]

parents = [1]
while parent = parents.pop
    $children[parent].each{|c|
        $children[c] = neighber[c]-[parent]
        parents.push(c)
    }
end

$ans = []
$idx = 1
def dfs(x)
    if $children[x].size == 0
        $ans[x] = [$idx,$idx]
        $idx+=1
    else
        $ans[x] = [$idx]
        $children[x].each{|i|
            dfs(i)
        }
        $ans[x][1] = $idx-1
    end
end

dfs(1)
$ans[1..n].each{|a|
    puts a*" "
}