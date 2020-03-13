#WA...

n,k=gets.split.map(&:to_i)
s=$<.map{|l|l[0]}.each_with_object(Hash.new{0}){|si,o|o[si]+=1}
l=s.values.sort

ans=0
while l[-3]&&l[-3]>0
  ans+=1
  (-3..-1).each{|i|
    l[i]-=1
  }
  l.sort!
end
p ans
