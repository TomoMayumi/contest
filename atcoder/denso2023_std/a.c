#include <stdio.h>

int main(){
    int a,b,c;
    int x1,x2,x3,x4;
    int max;

    // 入力
    scanf("%d %d %d",&a,&b,&c);
    // 4パターンの値を計算
    x1 = a+b+c;
    x2 = a+b-c;
    x3 = a-b+c;
    x4 = a-b-c;
    // 最大値を求める
    if(x2 < x1){
        max = x1;
    }else{
        max = x2;
    }

    if(max < x3){
        max = x3;
    }

    if(max < x4){
        max = x4;
    }
    // 出力
    printf("%d\n",max);
}