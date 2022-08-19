gets.to_i.times{|i|
    print "Case ##{i+1}: "
    n,k=gets.split.map(&:to_i)
    e=gets.split.map(&:to_i)
    sum=e.sum
    mul=e.map{|i|i*i}.sum
    dif=mul-sum**2
    if k==1
        ans = "IMPOSSIBLE"
        if dif==0
            ans = 0
        elsif sum != 0
            tmp=dif/2/sum
            ans = tmp if (sum+tmp)**2 == mul+tmp**2
        end
        puts ans
    else
        if dif==0
            # 差がもともと0なら、変化させない（0を追加しても差は変わらない）
            ans = [0]
        else
            # 追加する値によって、差が2*sum*[追加する値]だけ増減する
            # なので、[追加する値]=差/2/sum となり、これが整数になればよい。
            # 差は必ず偶数なので、sumが1になれば、[追加する値]は必ず整数になる。
            # よって、まずはsumを1にする値を一つ目で追加し、その後差が0になる値を計算して追加する
            ans = []
            ans[0] = 1-sum
            ans[1] = (mul+ans[0]**2-1)/2
        end
        puts ans*" "
    end
}