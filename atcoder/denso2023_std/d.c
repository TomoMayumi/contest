#include <stdio.h>
#include <stdlib.h>

#define TRUE  (1)
#define FALSE (0)

int pow(int x, int n);
void makePattern(int pattern, int n, int *group);
int check(int m, int *a, int *b, int *group);

int main(){
    int n,m,a[100],b[100];  // 入力
    int group[13];          // 子供が属するグループ番号
    int loopmax;            // グループ分けのパターン数
    int i;

    // 入力
    scanf("%d %d", &n, &m);
    for(i=0; i<m; i++){
        scanf("%d %d", &a[i], &b[i]);
    }

    // グループの分け方を全パターン試す
    loopmax = pow(3,n); // 3のn乗
    for(i=0; i<loopmax; i++){
        // i個目のグループ分けパターンを作成
        makePattern(i, n, group);
        // 問題の条件に合うかどうか確認し、合えば出力して終了
        if(check(m, a, b, group) == TRUE){
            printf("Yes\n");
            exit(0);
        }
    }
    // 全パターン試してどれも条件に合わなかったら出力して終了
    printf("No\n");
    return 0;
}

// xのn乗
int pow(int x, int n){
    int i,ret;
    ret = 1;
    for(i=0; i<n; i++){
        ret *= x;
    }
    return ret;
}

// patternに対応したgroupを作成
void makePattern(int pattern, int n, int *group){
    int i;
    for(i=0; i<n; i++){
        group[i] = pattern % 3;
        pattern /= 3;
    }
    return;
}

// group[]で分けた場合に問題の条件が成り立つ場合はTRUEを返す
int check(int m, int *a, int *b, int *group){
    int i;
    for(i=0; i<m; i++){
        if(group[a[i]-1] == group[b[i]-1]){
            return FALSE;
        }
    }
    return TRUE;
}
