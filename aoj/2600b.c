#include <stdio.h>

#define MAX_SIZE 100002

#define OK  0
#define NG  1

#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))


int Col[MAX_SIZE];
int Row[MAX_SIZE];

/* いもす準備された配列とサイズを受け取り、いもす展開しながら全て1以上であればOKを返す */
int check(int list[],int list_size){
    int i,ret;

    ret = OK;
    /* いもす展開 ＆ 判定 */
    for(i=0;i<list_size;i++){
        if(list[i]<=0){
            ret = NG;
            break;
        }
        list[i+1]+=list[i];
    }
    return ret;
}

int main(){
    int n,w,h;
    int xi,yi,wi;
    int i,ans;

    /* 初期化 */
    for(i=0;i<MAX_SIZE;i++){
        Col[i]=0;
        Row[i]=0;
    }

    /* いもす準備 */
    scanf("%d %d %d",&n,&w,&h);
    for(i=0;i<n;i++){
        scanf("%d %d %d",&xi,&yi,&wi);
        Col[MAX(xi-wi,0)]++;
        Col[MIN(xi+wi,w)]--;
        Row[MAX(yi-wi,0)]++;
        Row[MIN(yi+wi,h)]--;
    }

    /* いもす展開 ＆ 判定 */
    /* 縦か横のどちらかが全範囲を網羅できていればよい */
    if( (check(Col,w)==OK) || (check(Row,h)==OK) ){
        printf("Yes\n");
    }else{
        printf("No\n");
    }

    return 0;

}
