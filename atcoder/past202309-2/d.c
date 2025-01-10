#include <stdio.h>

int main(){
    int n;
    unsigned long long a[100000];
    int max;
    int i;

    scanf("%d",&n);

    max = 0;
    for(i=0;i<n;i++){
        scanf("%d",&a[i]);
        if(max < a[i]){
            max = a[i];
        }
    }

    for(i=0;i<n;i++){
        int ans = (1000000000 * a[i] + (max/2)) / max;
        printf("%d%c",ans, i<n-1 ? ' ' : '\n');
    }

    return 0;
}