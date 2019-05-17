#include <stdio.h>

#define N 101

int check(int s,int d,int v);

int root[N][N]; /* rooter path */
int visited[N]; /* already visited flag */

int que[N][2];  /* queue for bfs {rooter id, num of rooter} */
int wp,rp;      /* write pointer, read pointer for queue */

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
    int i,ret,id,num,nextid;

    for(i=0;i<N;i++)visited[i]=0;

    /* init que */
    wp=0;
    rp=0;

    visited[s]=1;
    /* push que */
    que[wp][0]=s;
    que[wp][1]=1;
    wp++;

    while(rp<wp){
        /* pop que */
        id=que[rp][0];
        num=que[rp][1];
        rp++;

        if(id==d) return num; /* goal(return num of rooter) */
        if(num>=v) continue;/* TTL is too small */

        /* check next rooter */
        for(i=0;root[id][i];i++){
            nextid=root[id][i];

            if(visited[nextid]) continue; /* already visited */
            visited[nextid]=1;

            /* push que */
            que[wp][0]=nextid;
            que[wp][1]=num+1;
            wp++;
        }
    }

    return 0;/* can't alive */
}
