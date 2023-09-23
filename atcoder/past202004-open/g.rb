s=[]
gets.to_i.times{
    t,cd,x=gets.split
    case t.to_i
    when 1
        s<<[cd,x.to_i]
    when 2
        cnt=cd.to_i
        ans=Hash.new{0}
        while cnt>0
            break unless s[0]
            if s[0][1] > cnt
                ans[s[0][0]]+=cnt
                s[0][1] -= cnt
                cnt=0
            else
                c,i=s.shift
                ans[c]+=i
                cnt-=i
            end
        end
        p ans.values.map{|i|i**2}.sum
    end
}