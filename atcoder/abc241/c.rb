n=gets.to_i

s=['.'*(n+10)]+(1..n).map{'.'+gets.chomp+'.'*10}+['.'*(n+10)]*10

row=(0..n+10).map{[0]*(n+10)}
col=(0..n+10).map{[0]*(n+10)}
slp=(0..n+10).map{[0]*(n+10)}
sl2=(0..n+10).map{[0]*(n+10)}

ar=(1..n).any?{|i|
    (1..n).any?{|j|
        (row[i][j] = row[i][j-1]-(s[i][j-6]=='#'?1:0)+(s[i][j]=='#'?1:0)) > 3
    }
}
ac=(1..n).any?{|i|
    (1..n).any?{|j|
        (col[i][j] = col[i-1][j]-(s[i-6][j]=='#'?1:0)+(s[i][j]=='#'?1:0)) > 3
    }
}

(1..5).each{|i|
    (1..n).each{|j|
        slp[i][j] = slp[i-1][j-1]+(s[i][j]=='#'?1:0)
    }
}
asl=(6..n).any?{|i|
    (1..5).each{|j|
        slp[i][j] = slp[i-1][j-1]+(s[i][j]=='#'?1:0)
    }
    (6..n).any?{|j|
        ((slp[i][j] = slp[i-1][j-1]-(s[i-6][j-6]=='#'?1:0)+(s[i][j]=='#'?1:0)) > 3)
    }
}

(1..5).each{|i|
    (1..n).each{|j|
        sl2[i][j] = sl2[i-1][j+1]+(s[i][j]=='#'?1:0)
    }
}
asl2=(6..n).any?{|i|
    ans=(1..n-5).any?{|j|
        (sl2[i][j] = sl2[i-1][j+1]-(s[i-6][j+6]=='#'?1:0)+(s[i][j]=='#'?1:0)) > 3
    }
    (n-4..n).each{|j|
        sl2[i][j] = sl2[i-1][j+1]-(s[i-6][j+6]=='#'?1:0)+(s[i][j]=='#'?1:0)
    }
    ans
}
puts [ar,ac,asl,asl2].any? ? "Yes" : "No"
#slp.each{|i|puts i*""}
#puts
#sl2.each{|i|puts i*""}
