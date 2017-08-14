#include <stdio.h>

typedef long long ll;

ll lcm(ll a, ll b);
ll gcd(ll a, ll b);

ll lcm(ll a, ll b){
    return a/gcd(a,b)*b;
}

ll gcd(ll a, ll b){
    if(a<b) return gcd(b,a);
    if(b==0)return a;
    return gcd(b,a%b);
}


int main(){
    int n,i;
    ll ans,t;

    scanf("%d",&n);

    ans=1;
    for(i=0;i<n;i++){
        scanf("%lld",&t);
        ans=lcm(ans,t);
    }

    printf("%lld\n",ans);
    return 0;
}
