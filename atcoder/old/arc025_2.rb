h,w=gets.split.map(&:to_i)
c=(1..h).map{gets.split.map(&:to_i)}

sumary=(0..h).map{[0]*(w+1)}

(1..h).each{|i|
    wary = [0]
    (1..w).each{|j|
        val = c[i-1][j-1]
        if (i+j).odd?
            val = -val
        end
        wary[j] = wary[j-1] + val
        sumary[i][j] = sumary[i-1][j] + wary[j]
    }
}

max = 0

(0..h-1).each{|hs|
    (0..w-1).each{|ws|
        (hs+1..h).each{|he|
            (ws+1..w).each{|we|
                sum = sumary[he][we] - sumary[hs][we] - sumary[he][ws] + sumary[hs][ws]
                if sum == 0
                    cellcnt = (he-hs)*(we-ws)
                    max = [max,cellcnt].max
                end
            }
        }
    }
}


p max
