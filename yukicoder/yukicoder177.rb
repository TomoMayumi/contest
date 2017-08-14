# グラフの最大フローを求める
class MaxFlow
  def initialize
    @node={}#Hash.new{|h,k|h[k]=[]}
  end

  # ノード追加（外から呼ぶ必要なし）
  def add_node(name)
    @node[name]||=Hash.new{0}
  end

  # エッジ追加
  # costは整数でないと計算できない（INFに当たる値を入れたいときは十分大きい整数にする）
  def add_edge(src,dst,cost)
    add_node(src)
    add_node(dst)
    @node[src][dst]=cost
  end

  # srcからdstの最大フロー時の流量のグラフを以下の形式のハッシュで返す
  # (YAML形式で示す)
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
      # srcからdstへのパスを幅優先探索
      #p residual
      pre={}
      q=[src]
      while q[0] && !pre[dst]
        sr=q.shift
        residual[sr]&&residual[sr].each{|d,c|
          pre[d]||=(q << d;sr)
        }
      end
      # dstへのパスが見つからなくなったら終了
      break if !pre[dst]
      path=[]
      ds=dst
      co=residual.values.flat_map(&:values).max
      # パスを経路復元し、そのパスの流量を求める
      while ds!=src
        #p ds
        sr=pre[ds]
        co=[residual[sr][ds],co].min
        path.unshift [sr,ds]
        ds=sr
      end
      # 元のグラフから流量を引いた残余グラフを求める
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
  # srcからdstの最大フロー時の流量を返す
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
