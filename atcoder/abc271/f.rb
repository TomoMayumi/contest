n=gets.to_i
a=(1..n).map{gets.split.map(&:to_i)}
m=(0..n).map{(0..n).map{Hash.new(0)}}
mr=(0..n).map{(0..n).map{Hash.new(0)}}

m[0][n][0]=1
(0...n).each{|i|
    (0...n-i).each{|j|
        m[i-1][j].each{|k,v|
            m[i][j][k^a[i][j]]+=v
        }
        m[i][j-1].each{|k,v|
            m[i][j][k^a[i][j]]+=v
        }
    }
}
mr[n-1][n][0]=1
(n-1).downto(1){|i|
    (n-1).downto(n-1-i-1){|j|
        mr[i+1][j].each{|k,v|
            mr[i][j][k^a[i][j]]+=v
        }
        mr[i][j+1].each{|k,v|
            mr[i][j][k^a[i][j]]+=v
        }
    }
}
ans=0
(0...n).each{|i|
    m[i][n-1-i].each{|k,v|
        ans+=v*mr[i+1][n-1-i][k]
        ans+=v*mr[i][n-1-i+1][k]
    }
}
p ans
