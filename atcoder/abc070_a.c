#include <stdio.h>
#include <string.h>

int main(){
    char s[6];
    int len;
    int i;
    int ans;

    scanf("%s",s);
    len=strlen(s);

    ans = 1;
    for(i=0;i<len/2;i++){
        if(s[i]!=s[len-1-i]){
            ans = 0;
            break;
        }
    }

    printf(ans?"Yes\n":"No\n");
    return 0;
}