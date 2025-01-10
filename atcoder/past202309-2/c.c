#include <stdio.h>

int main(){
    int n,a;
    int count[8] = {0};
    int min;
    int i;

    scanf("%d",&n);

    for(i=0;i<n;i++){
        scanf("%d",&a);
        count[a-1]++;
    }

    min = 500000;
    for(i=0;i<8;i++){
        if(count[i] < min){
            min = count[i];
        }
    }

    printf("%d\n",min);

    return 0;
}