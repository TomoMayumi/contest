#include <stdio.h>
#include <stdlib.h>

int main(){
    int n,m,i,base,dig;
    scanf("%d %d",&n,&m);
    base=1;
    dig=10;
    for(i=1;i<n;i++){
        base+=dig;
        dig*=10;
    }
    while(base>0){
        for(i=9;i>0;i--){
            if(base*i%m==0){
                printf("%d\n",base*i);
                exit(0);
            }
        }
        base/=10;
    }

    return 0;
}