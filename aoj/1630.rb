require 'pp'

class BIT
  def initialize(size)
    @size = size
    @buf = [0]*(size+1)
  end
  def add(idx,val)
    while idx<=@size
      @buf[idx] += val
      idx += (idx&-idx)
    end
  end

  def sum(idx)
    ret = 0
    while idx>0
      ret += @buf[idx]
      idx -= (idx&-idx)
    end
    return ret
  end
end

class BIT_MUL
  def initialize(size)
    @size = size
    @buf = [0]*(size+1)
  end
  def add(idx,val)
    while idx<=@size
      @buf[idx] *= val
      idx += (idx&-idx)
    end
  end

  def sum(idx)
    ret = 0
    while idx>0
      ret *= @buf[idx]
      idx -= (idx&-idx)
    end
    return ret
  end
end

class EXP
  def initialize(buf)
    #p ["e",buf]
    @list = []
    @list << TERM.new(buf)
    while buf[0] == '+'
      buf.shift
      @list << TERM.new(buf)
    end
  end
end
class TERM
  def initialize(buf)
    #p ["t",buf]
    @list = []
    @list << FACT.new(buf)
    while buf[0] == '*'
      buf.shift
      @list << FACT.new(buf)
    end
  end
end
class FACT
  def initialize(buf)
    #p ["f",buf]
    @val
    case buf[0]
    when '('
      buf.shift
      @val = EXP.new(buf)
      c = buf.shift
      raise ArgumentError if c != ')'
    when /[1-9]/
      @val = buf.shift.to_i
    else
      raise ArgumentError
    end
  end
end



def parse_and_check(s,n)
    #p ["call parse_and_check",s*"",n]
    cnt = 0
    list = []

    while s[0]
        case (c=s.shift)
        when /[1-9]/,'+','*'
            list << c
        when '('
            v,c = parse_and_check(s,n)
            cnt += c
            list << v
        when ')'
            c = check(list,n)
            cnt += c
            #p ["ret",s*"",list*"",[eval(list*""),cnt]]
            return [eval(list*""),cnt]
        end
        #p ["list",list]
    end
    c = check(list,n)
    cnt += c
    #p ["ret",s*"",list*"",[eval(list*""),cnt]]
    return [eval(list*""),cnt]
end


def check(list,n)
    #p ["call check",list*"",n]
    cnt = 0.step(list.size-1,2).flat_map{|l|
        l.step(list.size-1,2).map{|r|
            eval(list[l..r]*"")
        }
    }.count(n)
    #p ["check ret",list*"",n,cnt]
    return cnt
end

# 尺取り法が実装できない。。。→そもそも単純に尺取り法しても正しく数えられない。項毎に考える等の対処がいる。。
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
        end
        left += 2
        right = left if right < left
#        break if right > max
#        while left < right && eval(list[left..right]*"") >= n
#            left += 2
#            p ["b",left,right,list[left..right]*""]
#            if eval(list[left..right]*"") == n
#                cnt += 1
#            end
#            p ["a2",left,right,list[left..right]*""]
#        end
#        break if right >= max-1
#        right+=2 if left==right
    end
    p ["check ret",list*"",n,cnt]
    return cnt
end

while((n=gets.to_i)>0)
    s=gets.chomp.chars
    exp = EXP.new(s)
#    value,cnt = parse_and_check(s,n)
    raise ArgumentError if s[0]
    #pp exp
end
