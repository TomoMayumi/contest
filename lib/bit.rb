
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


if __FILE__ == $0
  def assert(exp);exp||throw(exp);end
  bit = BIT.new(10)

  bit.add(2,3)
  bit.add(3,4)
  bit.add(5,5)

  assert(bit.sum(2)==3)
  assert(bit.sum(3)==7)
  assert(bit.sum(5)==12)

end