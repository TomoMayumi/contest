#include <stdio.h>

int main(){
    int month;

    scanf("%d",&month);

    if( 4 <= month && month <= 9){
        printf("Yes\n");
    }else{
        printf("No\n");
    }

    return 0;
}