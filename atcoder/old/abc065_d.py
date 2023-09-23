class UnionFind3:
    def __init__(self, size):
        self.table = [-1 for _ in xrange(size)]

    def find(self, x):
        if self.table[x] < 0:
            return x
        else:
            self.table[x] = self.find(self.table[x])
            return self.table[x]

    def union(self, x, y):
        s1 = self.find(x)
        s2 = self.find(y)
        if s1 != s2:
            if self.table[s1] <= self.table[s2]:
                self.table[s1] += self.table[s2]
                self.table[s2] = s1
            else:
                self.table[s2] += self.table[s1]
                self.table[s1] = s2
            return True
        return False

uf=UnionFind3(100001)

n = input()
cities = [map(int,raw_input().split(" "))+[i] for i in range(n)]

cities_x = sorted(cities, key=lambda a:a[0])
cities_y = sorted(cities, key=lambda a:a[1])

road = [[cities_x[i+1][0]-cities_x[i][0],cities_x[i][2],cities_x[i+1][2]] for i in range(n-1)]
road +=[[cities_y[i+1][1]-cities_y[i][1],cities_y[i][2],cities_y[i+1][2]] for i in range(n-1)]

sum = 0
for (cost,i,j) in sorted(road):
    if(uf.find(i)!=uf.find(j)):
        uf.union(i,j)
        sum += cost

print sum
