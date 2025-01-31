require 'prime'

def square?(n)
  n.prime_division.all? {|v| (v[1] % 2).zero? }
end

n,m=gets.split.map(&:to_i)

step=(0..1000).select{|i|
    j=(m-i**2)
    j>=0 && (j==0 || square?(j))
}.flat_map{|i|
    j=(m-i**2)**0.5
    [[i,j],[-i,j],[i,-j],[-i,-j]].uniq
}

ma=(1..n).map{[1000]*n}
ma[0][0]=0

q=[[0,0]]

while q[0]
    x,y=q.shift
    s=ma[x][y]+1
    step.each{|dx,dy|
        nx=x+dx
        ny=y+dy
        if nx>=0 && nx<n && ny>=0 && ny<n && ma[nx][ny]>s
            ma[nx][ny]=s
            q<<[nx,ny]
        end
    }
end
puts ma.map{|a|a.map{|i|i==1000?-1:i}*" "}*"\n"
