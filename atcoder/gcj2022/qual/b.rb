gets.to_i.times{|i|
    print "Case ##{i+1}: "
    a = (1..3).map{gets.split.map(&:to_i)}.transpose.map(&:min)
    if a.sum < 1000000
        puts "IMPOSSIBLE"
    else
        sum = a[0]
        (1..3).each{|i|
            if sum + a[i] > 1000000
                a[i] = 1000000 - sum
                sum = 1000000
            else
                sum += a[i]
            end
        }
        puts a*" "
    end
}
