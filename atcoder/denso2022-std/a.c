#include <stdio.h>

int main(){
    int gold,silver,bronze; // 各メダルの枚数
    int sum;                // メダルの総数

    // 入力
    scanf("%d %d %d", &gold, &silver, &bronze);

    // 総数を計算
    sum = gold + silver + bronze;

    // 出力
    printf("%d\n", sum);

    return 0;
}
