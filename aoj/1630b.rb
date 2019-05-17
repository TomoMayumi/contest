require 'pp'

def parse_and_check(s,n)
  cnt = check2(s.split(/(\+|\*)/),n)
  return [eval(s),cnt]
end

# ŽÚŽæ‚è–@
def check2(list,n)
  p ["call check",list*"",n]
  left = 0
  right = 0
  cnt = 0
  max = list.size
  while right < max
    while right < max && eval(list[left..right]*"") < n
      right+=2
      p ["a",left,right,list[left..right]*"",cnt]
    end
    p ["b",left,right,list[left..right]*"",cnt]
    if eval(list[left..right]*"") == n
      cnt += 1
      tmp_right = right + 1
      while list[tmp_right,2] == ["*","1"]
        cnt += 1
        tmp_right += 2
      end
    end
    left += 2
    right = left if right < left
  end
  p ["check ret",list*"",n,cnt]
  return cnt
end

while((n=gets.to_i)>0)
  s=gets.chomp
  ans=0
  while s=~/\(([1-9\+\*]+)\)/
    value,cnt = parse_and_check($1,n)
    ans += cnt
    s.sub!($&,value.to_s)
  end
  value,cnt = parse_and_check(s,n)
  ans += cnt
  p ans
end
