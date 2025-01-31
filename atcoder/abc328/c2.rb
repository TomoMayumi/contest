#/* RMQ：[0,n-1] について、区間ごとの最小値を管理する構造体
#    update(i,x): i 番目の要素を x に更新。O(log(n))
#    query(a,b): [a,b) での要素を取得。O(log(n))
#*/
class SegTree
    # @n 葉の数
    # @dat 完全二分木の配列
    def initialize(n_, init_data = nil) # 葉の数は 2^x の形
        x = 1
        while (n_ > x)
            x *= 2
        end
        @n = x
        @dat = init_data || [0]*(2*x-1)
    end

    def update(i, x)
        i += @n - 1
        @dat[i] = x
        while (i > 0)
            i = (i - 1) / 2 # parent
            @dat[i] = [@dat[i * 2 + 1], @dat[i * 2 + 2]].sum
        end
    end

    def query(a, b)
        query_sub(a, b, 0, 0, @n)
    end
    def query_sub(a, b, k, l, r)
#        p [a,b,k,l,r]
        if (r <= a || b <= l)
            return 0;
        elsif (a <= l && r <= b)
            return @dat[k]
        else
            vl = query_sub(a, b, k * 2 + 1, l, (l + r) / 2);
            vr = query_sub(a, b, k * 2 + 2, (l + r) / 2, r);
            return [vl, vr].sum
        end
    end
    def printdata
        p @dat
    end
end

n,q=gets.split.map(&:to_i)
s=gets.chomp
sl=s.size
sll=1
sll*=2 while sll < sl
data=[(s.chars.each_cons(2).map{|a,b|a==b ? 1 : 0}+[0]*sll)[0,sll]]
while data[0].size > 1
    data.unshift data[0].each_slice(2).map{|a,b|a+b}
end
tree=SegTree.new(s.size-1,data.flatten)
#s.chars.each_cons(2).with_index{|(a,b),i|
#    tree.update(i,1) if a==b
#}
#tree.printdata
q.times{
    l,r=gets.split.map(&:to_i)
    if l==r
        p 0
        next
    end
    p tree.query(l-1,r-1)
}