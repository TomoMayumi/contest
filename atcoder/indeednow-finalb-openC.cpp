#include <bits/stdc++.h>

using namespace std;

int n,c[5005],dp[5005];
char s[5005];
vector<int> l[5005];
int main(){
    cin>>n;
    cin>>s;
    for(int i=0;i<n;i++) cin>>c[i];
    for(int i=0;i<n;i++) l[i].push_back(1);
    for(int i=0;i<n;i++){
        int d=1;
        while((i-d>=0)&&(i+d<n)&&(s[i-d]==s[i+d])){
            l[i-d].push_back(d*2+1);
            d++;
        }
        d=1;
        while((i-d+1>=0)&&(i+d<n)&&(s[i-d+1]==s[i+d])){
            l[i-d+1].push_back(d*2);
            d++;
        }
    }
    
    dp[0]=0;
    for(int i=1;i<=n;i++) dp[i]=1000000000;
    for(int i=0;i<n;i++)for(int j:l[i])if(dp[i+j]>dp[i]+c[j-1])dp[i+j]=dp[i]+c[j-1];
    cout<<dp[n]<<endl;
    return 0;
}

