n=gets.to_i
a=[gets.split.map(&:to_i)]
ans=0
while a[0]
    p a
    a=a.flat_map{|ai|
        min=ai.min
        ans+=min
        r=ai.chunk{|i|i>min}.to_a
        p r
        if r[2]&&r[0][0]&&r[-1][0]
            r[0][1]=r[-1][1]+r[0][1]
            r.pop
        end
        r.select{|f,ai|f}.map{|f,ai|ai}
    }
end
p ans