#include <stdio.h>
#include <stdlib.h>

#define MAX   (1<<15)

/* 引数の配列prime（要素数n）に対し             */
/* インデックス0～n-1が素数かどうかを格納する。 */
/* 素数であれば1、そうでなければ0               */
void make_prime( char prime[], int n ){
    int i,j;        /* ループ用一時変数 */

    /* 初期化 */
    for( i=0; i<n; i++ ){
        prime[i] = 1;
    }

    /* 素数リスト生成：エラトステネスのふるい */
    prime[0]=prime[1]=0;
    for( i=0; i<n; i++ ){
        if( prime[i] ){
            for( j=i*2; j<n; j+=i ){
                prime[j] = 0;
            }
        }
    }
}

int calc( const char prime[], int n ){
    int i;
    int cnt;

    /* i(2～n/2)について */
    cnt = 0;
    for( i=2; i<=n/2; i++){
        if( prime[i] && prime[n-i] ){
            cnt++;
        }
    }
    return cnt;
}

int main(){
    int n;
    char prime[ MAX+1 ];

    /* インデックスの値が素数かどうかを示すリストを作成 */
    make_prime( prime, MAX+1 );

    while( 1 ){
        /* scanfに失敗した場合もループを抜けるように0で初期化 */
        n = 0;
        scanf( "%d", &n );
        if( n<=0 ) break;

        printf( "%d\n", calc( prime, n) );
    }

    return 0;
}
