a=[]
gets.to_i.times{
    q,x,k=gets.split.map(&:to_i)
    case q
    when 1
        idx = a.bsearch_index{|i|i>=x}
        if idx
            a.insert(idx,x)
        else
            a << x
        end
    when 2
        idx = a.bsearch_index{|i|i>x} || a.size
        if idx-k >= 0
            p a[idx-k]
        else
            p -1
        end
    when 3
        idx = a.bsearch_index{|i|i>=x} || a.size
        p a[idx+k-1] || -1
    end
    #p [a,q,x,k,idx]
}