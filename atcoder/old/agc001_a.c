#include <stdio.h>
#include <stdlib.h>

int n,l[200];

int comp(const void *a, const void *b){
    int aa = *(int*)a;
    int bb = *(int*)b;
    if(aa<bb) return -1;
    if(aa==bb)return 0;
    return 1;
}

int main(){
    int i,sum;
    scanf("%d",&n);
    n*=2;
    for(i=0;i<n;i++){
        scanf("%d",&l[i]);
    }
    qsort(l,n,sizeof(int),comp);

    sum=0;
    for(i=0;i<n;i+=2){
        sum+=l[i];
    }
    printf("%d\n",sum);
}
