gets.to_i.times{|i|
    print "Case ##{i+1}: "
    n,k=gets.split.map(&:to_i)
    skip = 4*n-6
    step = (n*n)-1 - k
    log = []
    while skip > 0
        if step >= skip
            step -= skip
            start = n*n
            (skip+1).step(0,-8){|j|
                start -= j
            }
            log << ([start,start+skip+1]*" ")
            skip -= 8
        else
            skip -= 2
        end
    end
    if step > 0
        puts "IMPOSSIBLE"
    else
        puts log.size
        puts log
    end
}