#include <stdio.h>

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))

int main(){
    int a,b,c,d;

    scanf("%d %d %d %d",&a,&b,&c,&d);
    printf("%d\n",MAX(MIN(b,d)-MAX(a,c),0));
    return 0;
}
