#include <stdio.h>

#define MAX_N       10000
#define QUE_SIZE    500000

#define COST_NONE   0xFFFF


/* priority queue */
typedef struct _QueItem {
    unsigned short cost;
    unsigned short id;
} QueItem;
QueItem heapq[QUE_SIZE]; /* index 0: unuse, index 1.. : que */
int quecnt;

void enq(QueItem a);
QueItem deq();
int qcmp(QueItem a, QueItem b);


unsigned short cost[MAX_N];
unsigned short path[MAX_N][MAX_N];


int main(){
    int n,u,k,v,c;
    int i,j,tn,tk;
    int fin_cnt;
    QueItem item,item2;
    /* init */
    for(i=0;i<MAX_N;i++){
        for(j=0;j<MAX_N;j++){
            path[i][j]=COST_NONE;
        }
        cost[i]=COST_NONE;
    }
    /* input */
    scanf("%d",&n);
    for(tn=0;tn<n;tn++){
        scanf("%d %d",&u,&k);
        for(tk=0;tk<k;tk++){
            scanf("%d %d",&v,&c);
            path[u][v]=c;
        }
    }

    /* calc */
    cost[0] = 0;
    for(i=1;i<n;i++){
        if(path[0][i]!=COST_NONE){
            item.cost = path[0][i];
            item.id   = i;
            enq(item);
        }
    }

    fin_cnt = 1;
    while(fin_cnt<n){
        item = deq();
        if(cost[item.id]==COST_NONE){
            cost[item.id]=item.cost;
            fin_cnt++;
            for(i=0;i<n;i++){
                if(path[item.id][i]!=COST_NONE && cost[i]==COST_NONE){
                    item2.cost = item.cost + path[item.id][i];
                    item2.id   = i;
                    enq(item2);
                }
            }
        }
    }

    /* output */
    for(i=0;i<n;i++){
        printf("%d %d\n",i,cost[i]);
    }

    return 0;
}




/* add a to heapq */
void enq(QueItem a){
    int i;
    QueItem tmp;
    quecnt++;
    heapq[quecnt] = a;
    for(i=quecnt;i/2>0;i/=2){
        if(qcmp(heapq[i/2],heapq[i]))break;
        tmp = heapq[i];
        heapq[i] = heapq[i/2];
        heapq[i/2] = tmp;
    }
}

/* get highest priority item in heapq */
QueItem deq(){
    int i,target;
    QueItem tmp,ret;
    ret = heapq[1];
    heapq[1] = heapq[quecnt];
    quecnt--;
    for(i=1;i*2<=quecnt;){
        if( i*2+1<=quecnt && qcmp(heapq[i*2+1],heapq[i]) ){
            if( qcmp(heapq[i*2],heapq[i*2+1]) ){
                target = i*2;
            }else{
                target = i*2+1;
            }
        }else if( qcmp(heapq[i*2],heapq[i]) ){
            target = i*2;
        }else{
            break;
        }
        tmp = heapq[i];
        heapq[i] = heapq[target];
        heapq[target] = tmp;
        i = target;
    }
    return ret;
}

/* return TRUE if priority(a) > priority(b) */
int qcmp(QueItem a, QueItem b){
    return (a.cost<b.cost);
}
