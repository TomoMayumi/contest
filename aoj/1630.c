#include <stdio.h>

/*
E ::= T | E '+' T
T ::= F | T '*' F
F ::= '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '(' E ')'

拡張BNF記法の繰り返しの書き方に変換

E ::= T { '+' T }
T ::= F { '*' F }
F ::= '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '(' E ')'
*/


/*
計算結果がマイナスにはなりえないため、エラー時の戻り値としてマイナス値を使用する
*/

#define BUF_MAX 2000001

#define DEBUG

#ifdef DEBUG
#define dprintf      printf
#else
#define dprintf(...)
#endif

int g_Cnt;
int g_N;
char g_Buf[BUF_MAX];

int E(char **buf);
int T(char **buf);
int F(char **buf);

int E(char **buf){
    int ret;
    int t_ret;

    dprintf("E:%c\n",**buf);

    t_ret = T(buf);
    if(t_ret < 0){
        return -1;
    }
    ret = t_ret;
    while( **buf == '+' ){
        (*buf)++;
        t_ret = T(buf);
        if(t_ret < 0){
            return -1;
        }
        ret += t_ret;

        if(ret == g_N)g_Cnt++;
    }


    dprintf("Eret:%d\n",ret);

    return ret;
}

int T(char **buf){
    int ret;
    int f_ret;

    dprintf("T:%c\n",**buf);

    f_ret = F(buf);
    if(f_ret < 0){
        return -1;
    }
    ret = f_ret;
    while( **buf == '*' ){
        (*buf)++;
        f_ret = F(buf);
        if(f_ret < 0){
            return -1;
        }
        ret *= f_ret;

        if(ret == g_N)g_Cnt++;
    }

    dprintf("Tret:%d\n",ret);

    return ret;

}

int F(char **buf){
    int ret;
    int e_ret;

    dprintf("F:%c\n",**buf);

    switch(**buf){
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            ret = (**buf)-'0';
            (*buf)++;
            if(ret == g_N)g_Cnt++;
            break;
        case '(':
            (*buf)++;
            e_ret = E(buf);
            if(e_ret < 0){
                ret = -1;
                break;
            }
            if(**buf != ')'){
                ret = -1;
                break;
            }
            (*buf)++;
            ret = e_ret;
            break;
        default:
            ret = -1;
            break;
    }

    dprintf("Fret:%d\n",ret);

    return ret;
}

int main(){
    int n;
    int ret;
    char *ptBuf;
    while(1){
        scanf("%d",&g_N);
        if(g_N<=0)break;
        scanf("%s",g_Buf);
        g_Cnt = 0;
        ptBuf = g_Buf;
        ret = E(&ptBuf);
        if( *ptBuf != '\0' ){
            return -1;
        }
        printf("%d\n",g_Cnt);
    }

    return 0;
}
