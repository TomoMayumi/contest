srand
gets.to_i.times{|i|
    n,k = gets.split.map(&:to_i)
    # $stderr.puts "#{n},#{k}"
    a,b = gets.split.map(&:to_i)
    # $stderr.puts "#{a},#{b}"
    test = [*1..a-1,*a+1..n].sample(k)
    test.each{|i|
        puts "T #{i}"
        $stdout.flush
        # $stderr.puts "T #{i}"
        ii,tb = gets.split.map(&:to_i)
        # $stderr.puts "T #{i} -> #{ii} #{tb}" if i != ii
        b += tb
    }
    ans = b*n/(test.size+1)/2
    ans = n*(n-1)*2/3 if ans > n*(n-1)*2/3
    ans = n*4/3/2 if ans < n*4/3/2
    puts "E #{ans}"
    $stdout.flush
    # $stderr.puts "E #{ans}"
}
