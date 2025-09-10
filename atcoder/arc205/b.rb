n,m=gets.split.map(&:to_i)
edges = []
m.times{
  u,v=gets.split.map(&:to_i)
  u,v = u-1,v-1
  while edges[u]
    eu = edges[u]
    edges[eu] = nil
    edges[u] = nil
    u,v = [eu,v].sort
  end
  while edges[v]
    ev = edges[v]
    edges[ev] = nil
    edges[v] = nil
    u,v = [u,ev].sort
  end
  if u!=v
    edges[u] = v
    edges[v] = u
  end
}
all=n*(n-1)/2
edge_count=edges.count{|e|!e.nil?}/2
#p [all,edges,edge_count]
if n.odd?
  p all-edge_count
else
  p all-(edge_count-(n/2)).abs
end
