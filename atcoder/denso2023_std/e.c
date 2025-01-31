#include <stdio.h>
#include <stdlib.h>

#define TRUE  (1)
#define FALSE (0)

int dfs(int n, int a[], int ans_cnt, int ans[8][3], int used[8*3]);

int main(){
    int n,a[8*3];   // 入力
    int ans[8][3];  // 回答
    int ans_cnt;    // 回答の格納数
    int used[8*3];  // a[]の要素が使用済かどうか
    int ret;
    int i,j;
    // 入力
    scanf("%d", &n);
    for(i=0; i<n*3; i++){
        scanf("%d", &a[i]);
    }
    // ソート
    for(i=0; i<n*3; i++){
        for(j=1; j<n*3-i; j++){
            if(a[j-1] > a[j]){
                int tmp;
                tmp = a[j];
                a[j] = a[j-1];
                a[j-1] = tmp;
            }
        }
    }
    // 深さ優先探索
    ans_cnt = 0;
    for(i=0; i<n*3; i++)used[i] = FALSE;
    ret = dfs(n,a,ans_cnt,ans,used);
    // 出力
    if(ret == TRUE){
        printf("Yes\n");
        for(i=0; i<n; i++){
            printf("%d %d %d\n", ans[i][0], ans[i][1], ans[i][2]);
        }
    }else{
        printf("No\n");
    }
}

// 入力n,aから、条件を満たす回答があればansにそれを格納してTUREを返す深さ優先探索
int dfs(int n, int a[], int ans_cnt, int ans[8][3], int used[8*3]){
    int maxi,max;
    int x,xi,y,yi;
    int ret;
    // まだ使っていない最大のカードを求める
    max = -1;
    for(maxi=n*3-1; maxi>=0; maxi--){
        if(used[maxi] != TRUE){
            max = a[maxi];
            break;
        }
    }
    // すべて使用済みなら成功なのでTRUEを返す
    if(max == -1){
        return TRUE;
    }
    // 残ったカードのうち大きいものから順に、足してmaxになる対のカードがあるか探す
    // 対のカードがあれば、それらを除いて再帰してチェック
    for(xi=maxi; xi>=0; xi--){
        if(a[xi]*2 < max) break;
        if(used[xi] == TRUE) continue;
        x = a[xi];
        y = -1;
        for(yi=0; yi<n*3; yi++){
            if(used[yi] == TRUE) continue;
            if(a[yi] == max-x){
                y = a[yi];
                break;
            }
        }
        if(y != -1){
            used[xi] = TRUE;
            used[yi] = TRUE;
            used[maxi] = TRUE;
            ans[ans_cnt][0] = y;
            ans[ans_cnt][1] = x;
            ans[ans_cnt][2] = max;
            // printf("a[%d]:%d + a[%d]:%d = a[%d]:%d\n",xi,x,yi,y,maxi,max);
            ret = dfs(n, a, ans_cnt+1, ans, used);
            if(ret == TRUE){
                return TRUE;
            }
            used[xi] = FALSE;
            used[yi] = FALSE;
            used[maxi] = FALSE;
        }
    }
    // どのパターンも上手くいかなかった
    return FALSE;
}
