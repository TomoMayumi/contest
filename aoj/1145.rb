def check_size arr
  case a=arr.shift
  when /[A-Z]+/
    a.size
  when /\d+/
    a.to_i*check_size(arr)
  when ?(
    ans=0
    ans+=check_size(arr) while arr[0]!=?)
    arr.shift
    ans
  end
end

def get_ch arr,n
  while a=arr.shift
    case a
    when /[A-Z]+/
      l=a.size
      break a[n] if n<l
      n-=l
    when /\d+/
      tarr=arr.dup
      l=check_size(tarr)
      break get_ch(arr,n%l) if n<l*a.to_i
      arr=tarr
      n-=l*a.to_i
    end
  end
end

while (a,b=gets.split)!=[?0]*2
  puts get_ch(a.scan(/[A-Z]+|\(|\)|\d+/),b.to_i)||0
end