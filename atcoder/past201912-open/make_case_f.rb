def make_case
    n = rand(2..100000)
    chars = [*?a..?z]
    ssmall = (1..n).map{chars.sample}
    s = ""
    while ssmall[1]
        word = ssmall.pop(rand(2..n)).join
        word[0] = word[0].upcase
        word[-1] = word[-1].upcase
        s += word
    end
    if ssmall[0]
        n+=1
        word = ssmall[0].upcase+chars.sample.upcase
        s += word
    end
    return s
end


1000.times{|i|
    file_name = "test_f/rand-%03d.in"%[i]
    input = make_case
    File.open(file_name,"w"){|f|f.write(input)}
    ans = `ruby f.rb < #{file_name}`
    File.open(file_name.sub(".in",".out"),"w"){|f|f.write(ans)}
    out = `a.exe < #{file_name}`
    if ans != out
        p [ans,out]
        break
    end
}