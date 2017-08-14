#include <stdio.h>

#define PRIME_MAX (1<<15)

char prime[PRIME_MAX];

/* 素数リスト生成 */
void make_prime(){
    int i,j;
    for(i=0;i<PRIME_MAX;i++)prime[i]=1;
    prime[0]=0;
    prime[1]=0;
    for(i=2;i<=PRIME_MAX/2;i++){
        if(prime[i]){
            for(j=2*i;j<PRIME_MAX;j+=i){
                prime[j]=0;
            }
        }
    }
    
}

int main(){
    int i,n,cnt;

    make_prime();

    while(scanf("%d",&n)&&n){
        /* iとn-iがどちらも素数になるパターン数 */
        cnt=0;
        for(i=2;i<=n/2;i++){
            if(prime[i]&&prime[n-i])cnt++;
        }
        printf("%d\n",cnt);
    }

    return 0;
}