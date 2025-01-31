n,s=gets.split.map(&:to_i)
memo={0=>"Yes\n"}
n.times{
    a,b=gets.split.map(&:to_i)
    nextmemo={}
    memo.each{|k,v|
        nextmemo[k+a]||=v+"H"
        nextmemo[k+b]||=v+"T"
    }
    memo=nextmemo
}
puts memo[s] || "No"
