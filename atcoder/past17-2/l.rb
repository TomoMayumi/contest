INF=10000000000000
n=gets.to_i
cost=(0..n*2).map{[INF]*(n*2+1)}
(0..n*2).each{|i|
    cost[i][i]=0
}

# a
(1...n).map{|i|
    a=gets.split.map(&:to_i)
    a.each.with_index(i+1){|ai,j|
        cost[i][j] = ai
        cost[j][i] = ai
        cost[i+n][j+n] = ai
        cost[j+n][i+n] = ai
    }
}
# b
(1...n).map{|i|
    b=gets.split.map(&:to_i)
    b.each.with_index(i+1){|bi,j|
        cost[i][j+n] = bi
        cost[j][i+n] = bi
    }
}

(1..n*2).each{|k|
    (1..n*2).each{|i|
        next if i>n && k<=n
        (1..n*2).each{|j|
            next if k>n && j<=n
            cost[i][j] = [cost[i][j], cost[i][k] + cost[k][j]].min
        }
    }
}
(1..n-1).each{|i|
    puts cost[i][n+i+1,n-i]*" "
}

