10.times{|i|
    n = rand(1..10)
    k = rand(n)
    s = (1..n).map{[?X,?Y].sample}*""
    File.write("test_b/random_#{i}.in", "#{n} #{k}\n#{s}\n")
    ans = [*0...n].combination(k).map{|l|
        ss = s.dup
        l.each{|j|ss[j]=ss[j]==?X ? ?Y : ?X}
        [(0...n).count{|i|ss[i,2]=="YY"},ss]
    }.max
    File.write("test_b/random_#{i}.out", "#{ans[0]}\n#{ans[1]}\n")
}