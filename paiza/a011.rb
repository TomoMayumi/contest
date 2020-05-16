d,n=gets.split.map(&:to_i)
a0,*a=$<.map(&:to_i)

m=[nil]*(2*d+1)
m[a0]="R"
a.each{|ai|
  newm=[nil]*(2*d+1) 
  (-d..d).each{|di|
    if pre=m[di]
      newm[di-ai]=pre+"L" if di-ai>=-d
      newm[di+ai]=pre+"R" if di+ai<=d
    end
  }
  m=newm
}
puts m.compact[0]