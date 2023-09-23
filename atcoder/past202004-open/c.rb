n=gets.to_i
a=$<.read.chomp.split("\n")
(n-1).downto(1){|i|
    (0..n*2).each{|j|
        if a[i][j] == 'X'
            (j-1..j+1).each{|jj|
                a[i-1][jj] = 'X' if a[i-1][jj] == '#'
            }
        end
    }
}
puts a
