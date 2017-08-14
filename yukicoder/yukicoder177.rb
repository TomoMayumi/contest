# �O���t�̍ő�t���[�����߂�
class MaxFlow
  def initialize
    @node={}#Hash.new{|h,k|h[k]=[]}
  end

  # �m�[�h�ǉ��i�O����ĂԕK�v�Ȃ��j
  def add_node(name)
    @node[name]||=Hash.new{0}
  end

  # �G�b�W�ǉ�
  # cost�͐����łȂ��ƌv�Z�ł��Ȃ��iINF�ɓ�����l����ꂽ���Ƃ��͏\���傫�������ɂ���j
  def add_edge(src,dst,cost)
    add_node(src)
    add_node(dst)
    @node[src][dst]=cost
  end

  # src����dst�̍ő�t���[���̗��ʂ̃O���t���ȉ��̌`���̃n�b�V���ŕԂ�
  # (YAML�`���Ŏ���)
  # --
  # [src1]:
  #   [dst1]: [src1->dst1 cost]
  #   [dst2]: [src1->dst2 cost]
  #   [dst3]: [src1->dst3 cost]
  # [src2]:
  #   [dst1]: [src2->dst1 cost]
  #   [dst2]: [src2->dst2 cost]
  #   [dst3]: [src2->dst3 cost]
  def maxflowgraph(src,dst)
    residual=Hash[@node.map{|k,v|[k,v.dup]}]
    while true
      # src����dst�ւ̃p�X�𕝗D��T��
      #p residual
      pre={}
      q=[src]
      while q[0] && !pre[dst]
        sr=q.shift
        residual[sr]&&residual[sr].each{|d,c|
          pre[d]||=(q << d;sr)
        }
      end
      # dst�ւ̃p�X��������Ȃ��Ȃ�����I��
      break if !pre[dst]
      path=[]
      ds=dst
      co=residual.values.flat_map(&:values).max
      # �p�X���o�H�������A���̃p�X�̗��ʂ����߂�
      while ds!=src
        #p ds
        sr=pre[ds]
        co=[residual[sr][ds],co].min
        path.unshift [sr,ds]
        ds=sr
      end
      # ���̃O���t���痬�ʂ��������c�]�O���t�����߂�
      path.each{|s,d|
        residual[s][d]-=co
        if residual[s][d]==0
          residual[s].delete(d)
        end
        residual[d][s]+=co
      }
    end
    Hash[@node.map{|k,v|[k,Hash[v.map{|d,c|[d,c-residual[k][d]]}]]}]
  end
  # src����dst�̍ő�t���[���̗��ʂ�Ԃ�
  def maxflow(src,dst)
    graph=maxflowgraph(src,dst)
    graph[src]?graph[src].values.inject(:+):0
  end
end

(w,),(n,),j,(m,),c,*q=$<.map{|l|l.split.map(&:to_i)}
sum=0
mf=MaxFlow.new
INF=1000000
j.each.with_index(1){|a,i|
  mf.add_edge(:src,:"j#{i}",a)
}
c.each.with_index(1){|a,i|
  mf.add_edge(:"c#{i}",:sink,a)
}
q.each.with_index(1){|(_,*x),i|
  ([*1..n]-x).each{|j|
    mf.add_edge(:"j#{j}",:"c#{i}",INF)
  }
}
puts w>mf.maxflow(:src,:sink)?"BANSAKUTSUKITA":"SHIROBAKO"
