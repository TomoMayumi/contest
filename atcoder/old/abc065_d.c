#include <stdio.h>
#include <stdlib.h>

int UF[100000];
void init();
void u(int,int);
int  f(int);
void init(){int i;for(i=0;i<100000;i++)UF[i]=i;}
void u(int a,int b){UF[f(a)]=UF[f(b)];}
int  f(int c){if(c!=UF[c])UF[c]=f(UF[c]);return UF[c];}

int cities[100000][3];
int road[200000][3];

int comp_0(const void *a, const void *b){
    return (*(int (*)[3])a)[0] - (*(int (*)[3])b)[0];
}
int comp_1(const void *a, const void *b){
    return (*(int (*)[3])a)[1] - (*(int (*)[3])b)[1];
}

int main(){
    int i,n,x,y,cost;
    scanf("%d",&n);
    for(i=0;i<n;i++){
        scanf("%d %d",&x,&y);
        cities[i][0]=x;
        cities[i][1]=y;
        cities[i][2]=i;
    }
    qsort(cities, n, sizeof(int[3]), comp_0);
    for(i=0;i<n-1;i++){
        road[i][0]=cities[i+1][0]-cities[i][0];
        road[i][1]=cities[i][2];
        road[i][2]=cities[i+1][2];
    }
    qsort(cities, n, sizeof(int[3]), comp_1);
    for(i=0;i<n-1;i++){
        road[i+n-1][0]=cities[i+1][1]-cities[i][1];
        road[i+n-1][1]=cities[i][2];
        road[i+n-1][2]=cities[i+1][2];
    }
    qsort(road, 2*n-2, sizeof(int[3]), comp_0);

    init();
    cost=0;
    for(i=0;i<2*n-2;i++){
        x=road[i][1];
        y=road[i][2];
        if(f(x)!=f(y)){
            u(x,y);
            cost+=road[i][0];
        }
    }
    printf("%d\n",cost);
    return 0;
}

/*

UF=Hash.new{|_,k|k}
def u a,b;UF[f a]=UF[f b]end
def f c;c==UF[c]?c:UF[c]=f(UF[c])end

cities=(1..gets.to_i).map{|i|gets.split.map(&:to_i)+[i]}

road = cities.sort_by{|x,y,i|x}.each_cons(2).map{|(x1,y1,i),(x2,y2,j)|[x2-x1,i,j]}+
       cities.sort_by{|x,y,i|y}.each_cons(2).map{|(x1,y1,i),(x2,y2,j)|[y2-y1,i,j]}

p road.sort.inject(0){|s,(cost,i,j)|
  if f(i)!=f(j)
    u(i,j)
    s+cost
  else
    s
  end
}



*/