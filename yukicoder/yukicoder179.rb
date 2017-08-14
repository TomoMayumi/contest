gets
m=$<.read

ans=false
if m[?#]
  (1...m.size).each{|i|
    tm=m.dup
    m.size.times{|j|
      if tm[j]==?#
        if tm[i+j]==?#
          tm[j]=tm[i+j]=?.
        else
          break
        end
      end
    }
    if !tm[?#]
      ans=true
      break
    end
  }
end
puts ans ?:YES:"NO"