def maxHeapify(h, a, i)
  l = i*2+2
  r = i*2+1
  # 左の子、自分、右の子で値が最大のノードを選ぶ
  largest = [i,l,r].max_by{|i|a[i]||0}

  if largest != i # i の子の方が値が大きい場合
    a[i],a[largest] = a[largest],a[i]
    maxHeapify(h, a, largest) # 再帰的に呼び出し
  end
end

def buildMaxHeap(h, a)
  (h/2).downto(0){|i|
    maxHeapify(h, a, i)
  }
end

h = gets.to_i
a = gets.split.map(&:to_i)

buildMaxHeap(h, a)

puts " "+a*" "

