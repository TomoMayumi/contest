a=gets.chomp.bytes
b=gets.chomp.bytes
# 事前準備 次にある文字が出てくる位置をaは先頭からbは末尾から探索して記憶しておく
ah=[]
a.reverse_each{|i|
    ah[i-32]=ah.dup
}
bh=[]
b.each{|i|
    bh[i-32]=bh.dup
}

# クエリ対応
puts gets.to_i.times.map{
    s=gets.chomp.bytes
    n=s.size
    # aの部分列はどこまで可能か
    tah=ah
    sl = s.index{|c|!(tah=tah[c-32])}||n
    # bの部分列はどこまで可能か
    tbh=bh
    sr = s.reverse.index{|c|!(tbh=tbh[c-32])}||n
    # 結果
    if sl+sr<n || sl<=0 || sr<=0
        -1
    else
        n-[sl,sr,n/2].min*2
    end
}