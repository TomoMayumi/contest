h={15:2244,12:1870,10:1520,5:850,3:550,2:380}
m={0:0}

for i in range(50):
  if i in m:
    for k,v in h.items():
      m[i+k] = min(m.get(i+k,1e9),m[i]+v)

while True:
  n = input()
  if n == 0 : break
  print(m[n/100])
