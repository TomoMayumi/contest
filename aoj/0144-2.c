#include <stdio.h>

#define N 101

int check(int s,int d,int v);

int root[N][N]; /* rooter path */
int distance[N]; /* already visited flag */

int main(){
    int n,r,k,t;
    int p,s,d,v;
    int i,j;
    char c;
    int ans;

    /* init root */
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            root[i][j]=0;
        }
    }

    /* input */
    scanf("%d",&n);
    for(i=0;i<n;i++){
        scanf("%d",&r);
        scanf("%d",&k);
        for(j=0;j<k;j++){
            scanf("%d",&t);
            root[r][j] = t;
        }
    }


    scanf("%d",&p);
    for(i=0;i<p;i++){
        scanf("%d %d %d",&s,&d,&v);
        ans = check(s,d,v);
        printf(ans?"%d\n":"NA\n",ans);
    }
    return 0;
}
  
  
int check(int s,int d,int v){
    int i,dis,id,nextid;

    for(i=0;i<N;i++)distance[i]=0;

    /* rooter s to s is 1 distance */
    distance[s]=1;

    /* search [dis] distance rooter to [dis+1] distance rooter */
    for(dis=1;dis<v;dis++){
        for(id=0;id<N;id++){
            if(distance[id]==dis){
                /* set [dis+1] distance to next roter */
                for(i=0;root[id][i]>0;i++){
                    nextid=root[id][i];
                    if(distance[nextid]==0){
                        distance[nextid]=dis+1;
                    }
                }
            }
        }
    }

    return distance[d];
}
