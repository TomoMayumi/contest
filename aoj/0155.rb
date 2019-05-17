while (n = gets.to_i)>0
    biru = (1..n).map{gets.split.map(&:to_i)}.sort

    dif = biru.map{|_,x1,y1|
        biru.map{|_,x2,y2|
            dtmp = Math.hypot( (x1-x2), (y1-y2) )
            d = (dtmp > 50) ? 1e9 : dtmp
        }
    }

    m = gets.to_i
    m.times{
        s,g = gets.split.map{|i|i.to_i-1}
        pque = [[0,[s]]]
        ans = nil
        while pque[0]
            kyori,rireki = pque.shift
            last = rireki[-1]
            if last == g
                ans = rireki
                #p kyori
                break
            end
            (0...n).each{|i|
                d = dif[last][i]
                if !rireki.include?(i) && d < 1e9
                    pque << [kyori+d,rireki+[i]]
                end
            }
            pque.sort!
        end
        puts ans ? ans.map{|i|i+1}*" " : "NA"
    }
end

#while (n = gets.to_i)>0
#    biru = (1..n).map{gets.split.map(&:to_i)}.sort
#
#    dif = biru.map{|_,x1,y1|
#        biru.map{|_,x2,y2|
#            dtmp = (x1-x2)**2 + (y1-y2)**2
#            d = (dtmp > 50**2) ? 1e9 : dtmp
#            [d,[]]
#        }
#    }
#
#    n.times{|k|n.times{|i|n.times{|j|
#        dtmp = dif[i][k][0] + dif[k][j][0]
#        if dif[i][j][0] > dtmp
#            dif[i][j] = [dtmp,[*dif[i][k][1],k+1,*dif[k][j][1]]]
#        end
#    }}}
#
#    m = gets.to_i
#    m.times{
#        s,g = gets.split.map(&:to_i)
#
#        p [s,*dif[s-1][g-1][1],g]
#    }
#end
