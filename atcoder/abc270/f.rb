class UnionFind
    def initialize(size)
        @parent = Array.new(size, -1)
    end

    # xの親
    def root(x)
        return x if @parent[x] < 0
        @parent[x] = root(@parent[x])
    end

    # xとyは同じグループか？
    def same_parent?(x, y)
        root(x) == root(y)
    end

    # xとyを同じグループに
    def merge(x, y)
        x_root = root(x)
        y_root = root(y)

        return false if x_root == y_root

        x_root, y_root = y_root, x_root if @parent[x_root] > @parent[y_root]
            
        @parent[x_root] += @parent[y_root]
        @parent[y_root] = x_root

        return true
    end

    # xのグループのサイズ
    def size(x)
        return -@parent[root(x)]
    end

    # 全IDをグループごとに
    def groups
        return @parent.size.times.group_by{|i|root(i)}.values
    end
end

n,m=gets.split.map(&:to_i)
x=gets.split.map.with_index(1){|s,i|[i,n+1,s.to_i]}
y=gets.split.map.with_index(1){|s,i|[i,n+2,s.to_i]}
z=(1..m).map{gets.split.map(&:to_i)}

p [[z,n],[z+x,n+1],[z+x+y,n+2],[z+y,n+1]].map{|l,s|
    uf=UnionFind.new(n+3)
    cost=0
    l.sort_by{|a,b,c|c}.each{|a,b,c|
        cost+=c if uf.merge(a,b)
    }
    uf.size(1)==s ? cost : 1e19
}.min
