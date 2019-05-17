def maxHeapify(h, a, i)
  l = i*2+2
  r = i*2+1
  # ���̎q�A�����A�E�̎q�Œl���ő�̃m�[�h��I��
  largest = [i,l,r].max_by{|i|a[i]||0}

  if largest != i # i �̎q�̕����l���傫���ꍇ
    a[i],a[largest] = a[largest],a[i]
    maxHeapify(h, a, largest) # �ċA�I�ɌĂяo��
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

