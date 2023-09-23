#require 'pp'
H,W,K=gets.split.map(&:to_i)
S=[[0]]+(1..H).map{[0]+gets.chomp.chars.map(&:to_i)}

def check_renketu(block)
  ok,*left = *block
  ok = [ok]
  while ok[0]
    y,x=ok.pop
    left.reject!{|yi,xi|
      if (y-yi).abs+(x-xi).abs <= 1
        ok << [yi,xi]
      end
    }
  end
  left == []
end


h,w=3,4
blocks = (1..H-h).step(h).to_a.product((1..W-w).step(w).to_a).map{|ys,xs|
  cells = [*ys...ys+h].product([*xs...xs+w])
  block = cells.sort_by{|y,x|S[y][x]}[-8,8]
  if check_renketu(block)
    block
  else
    cells[0,8]
  end
}

p blocks.size
puts blocks.map{|cells|cells.map{|yx|yx*" "}}


__END__
#require 'pp'
H,W,K=gets.split.map(&:to_i)
S=[[0]]+(1..H).map{[0]+gets.chomp.chars.map(&:to_i)}

memo = {}

# 1�u���b�N���̓��_���v�Z���ĕԂ�
# return [score,[ block ]]
#   block = [[x,y]*8]
def calc_block(s,ys,xs,h,w)
  block = [*ys...ys+h].product([*xs...xs+w])
  score = block.map{|y,x|s[y][x]}.inject(:*)
  #p [score,[block]]
  return [score,[block]]
end


# �w��͈͂��e�핪�������ꍇ�̍ő�X�R�A�ɂȂ�u���b�N�Q��Ԃ�
# return [score,blocks]
#   blocks = [ block, block, ... ]
#   block = [[x,y]*8]
def dfs(memo,s,ys,xs,h,w)
  memo[[ys,xs,w,h]] ||= (
    #p [[ys,xs,w,h]]
    if w*h == 8
      # 1�u���b�N�ɂȂ������̓I�ȃX�R�A�v�Z
      calc_block(s,ys,xs,h,w)
    elsif w==0 || h==0
      # �����̌��� ��0������0�ɂȂ�����X�R�A0 (��1�⍂��1�̏ꍇ�̕����̗�O�����̑���)
      [0,[]]
    else
      # �c������2�������A�����đ傫���ق���K�p
      [
        [[ys,xs,h/2,w  ],[ys+h/2,xs    ,h/2,w  ]], # �c2����
        [[ys,xs,h,  w/2],[ys    ,xs+w/2,h  ,w/2]], # ��2����
      ].map{|l|
        l.map{|args|dfs(memo,s,*args)}.inject{|(s1,b1),(s2,b2)|[s1+s2,b1+b2]}
      }.max
    end
  )
end

score,blocks = [
  [1,1,32,32],
  [33,1,16,32],
  [1,33,32,16],
  [33,33,16,16],
].map{|args|dfs(memo,S,*args)}.inject{|(s1,b1),(s2,b2)|[s1+s2,b1+b2]}

p blocks.size
puts blocks.map{|cells|cells.map{|yx|yx*" "}}
#p score
__END__
h,w,k=gets.split.map(&:to_i)
s=[[0]]+(1..h).map{[0]+gets.chomp.chars.map(&:to_i)}

better = (1..k).select{|i|k%i==0}.map{|hi|
  wi = k / hi
  blocks =  (1..h).step(hi).to_a.product([*(1..w).step(wi)]).map{|y,x|
    if y+hi>h || x+wi>w
      nil
    else
      [*y...y+hi].product([*x...x+wi])
    end
  }.compact
  score = blocks.map{|cells|cells.map{|yi,xi|s[yi][xi]}.inject(:*)||0}.inject(:+)
  [score,hi,wi,blocks]
}.max

best_blocks = better[3]

p best_blocks.size
puts best_blocks.map{|cells|cells.map{|yx|yx*" "}}