import copy

def dfs(l,ans):
    if l==[]: return ans
    max = l.pop(-1)
    for i in range(len(l)-1,-1,-1):
        if l[i]*2 < max: break
        ll = copy.copy(l)
        y = ll.pop(i)
        x = max-y
        if x in ll:
            ll.remove(x)
            ret = dfs(ll,ans+[[x,y,max]])
            if ret: return ret
    return False

n=int(input())
a=sorted(map(int,input().split()))

ans=dfs(a,[])
if ans:
    print("Yes")
    for a in ans:
        print(" ".join(map(str,a)))
else:
    print("No")
