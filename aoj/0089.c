#include <stdio.h>

#define DATA_MAX     (52)
#define MAX(a,b)    ((a)>(b)?(a):(b))

int scan_line(int *buf){
    int cnt;
    char c;
    cnt = 0;
    while( scanf("%d%c",&buf[cnt],&c)>0 ){
        cnt++;
        if( c == '\n' )break;
    }
    return cnt;
}

int main(){
    int buf[2][DATA_MAX];
    int cnt[2];
    int now,pre;
    int i;

    cnt[0] = scan_line(buf[0]);
    pre = 0;
    now = 1;

    while( (cnt[now] = scan_line(buf[now])) > 0 ){
        if( cnt[pre] < cnt[now] ){
            /* upper half */
            /*     0       1     */
            /*   /   \   /   \   */
            /* 0       1       2 */
            /* +       +       + */
            /* 0    MAX(0,1)   1 */
            buf[now][0] += buf[pre][0];
            for( i=1; i<cnt[now]-1; i++){
                buf[now][i] += MAX(buf[pre][i-1], buf[pre][i]);
            }
            buf[now][i] += buf[pre][i-1];
        }else{
            /* lower half */
            /* 0       1       2 */
            /*   \   /   \   /   */
            /*     0       1     */
            /*     +       +     */
            /* MAX(0,1) MAX(1,2) */
            for( i=0; i<cnt[now]; i++){
                buf[now][i] += MAX(buf[pre][i], buf[pre][i+1]);
            }
        }
        pre = now;
        now = 1-pre;
    }

    printf("%d\n",buf[pre][0]);

    return 0;
}
