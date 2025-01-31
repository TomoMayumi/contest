def check dist,left,a
    ans = []
    a.each{|ci|
        min = left.map{|ji|dist[ci][ji]}.min
        use = left.select{|ji|dist[ci][ji]==min}
        break if use == [0]
        use.each
        left.delete(use)
        ans << [ci+1,use+1]*" "
    }
    (left == [0]) && ans
end

gets.to_i.times{|i|
    print "Case ##{i+1}: "
    n=gets.to_i
    cpos = (0..n-1).map{gets.split.map(&:to_i)}
    jpos = (0..n).map{gets.split.map(&:to_i)}

    dist = (0..n-1).map{|ci|
        (0..n).map{|ji|
            cx,cy=cpos[ci]
            jx,jy=jpos[ji]
            (cx-jx)**2+(cy-jy)**2
        }
    }
    ans = []
    l = [*0..n-1].permutation.find{|a|
        left = [*0..n]
        ans = check dist,left,a
    }

    if l
        puts "POSSIBLE"
        puts ans
    else
        puts "IMPOSSIBLE"
    end

}