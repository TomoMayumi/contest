#include <stdio.h>

#define MAX_HEIGHT 30
#define MAX_WIDTH  10

typedef unsigned char U1;
typedef signed   char S1;
typedef signed   int  S4;


/* 番号の組み合わせ毎に、入れ替え可能ならば入れ替え可能位置、そうでなければ0,0を入れる */
/* [0]：段 [1]：列 */
U1 irekae[MAX_WIDTH+1][MAX_WIDTH+1][2];

int main(){
    S4 n,m,atari,d;        /* 入力：各値 */
    S1 amida[MAX_WIDTH+2]; /* 入力：あみだくじの横線情報 両端に番兵0を固定で入れるため幅は+2 */
    S4 keika[MAX_WIDTH+1]; /* あみだくじ辿り中の番号の位置 インデックス0を使わないため幅を+1 */
    S4 i,j,tmp;            /* 計算時一時変数 */
    U1 tate,yoko;          /* 出力時一時変数 */

    while( (scanf("%d",&n)>0) && (n>0) ){
        /* 入力 */
        scanf("%d",&m);
        scanf("%d",&atari);
        scanf("%d",&d);

        /* 入れ替え可能位置情報の初期化 */
        /* i,j：縦線の番号 */
        for( i=1; i<=n; i++ ){
            for( j=1; j<=n; j++ ){
                irekae[i][j][0] = 0U;
                irekae[i][j][1] = 0U;
            }
        }

        /* あみだくじ初期位置設定 */
        for( i=1; i<=n; i++ ){
            keika[i]=i;
        }

        /* 左端を番兵0とする */
        amida[0]='0';
        /* 各段の情報を読み込みながら、あみだをたどりつつ、入れ替え可能な番号の組み合わせ・位置を記憶 */
        /* i：段目 , j：縦線の番号 */
        for( i=1; i<=d; i++){
            /* 読み込み後、右端を番兵0にする */
            scanf("%s",&amida[1]);
            amida[n]='0';
            for( j=1; j<=n-1; j++ ){
                /* 横線があれば入れ替える */
                if( amida[j]=='1' ){
                    tmp        = keika[j];
                    keika[j]   = keika[j+1];
                    keika[j+1] = tmp;
                }else{
                    /* 横線を追加可能な場合、入れ替え可能な番号と位置情報を記憶 */
                    if( (amida[j-1]=='0') && (amida[j+1]=='0') ){
                        /* 出発側に近い情報が優先なので、すでに記憶済みならば何もしない */
                        if(irekae[keika[j]][keika[j+1]][0]==0){
                            irekae[keika[j]][keika[j+1]][0]=i;
                            irekae[keika[j]][keika[j+1]][1]=j;

                            irekae[keika[j+1]][keika[j]][0]=i;
                            irekae[keika[j+1]][keika[j]][1]=j;
                        }
                    }
                }
            }
        }

        /* 出力 */
        tate = irekae[m][keika[atari]][0];
        yoko = irekae[m][keika[atari]][1];

        if(m==keika[atari]){
            /* 何もしなくても当たり */
            printf("0\n");
        }else{
            if(tate==0){
                /* 記憶されてなければたどり着けない */
                printf("1\n");
            }else{
                printf("%d %d\n",tate,yoko);
            }
        }
    }

    return 0;
}
