#include <stdio.h>
#include <stdlib.h>

int memo[26][26] = {0};

int compare_char(const void *a, const void *b)
{
    char input[10];
    char *pa = (char*)a;
    char *pb = (char*)b;

    if(memo[*pa-'A'][*pb-'A']==0){
        printf("? %c %c\n", *pa, *pb);
        fflush(stdout);

        scanf("%s",input);
        memo[*pa-'A'][*pb-'A'] = (input[0]=='<') ? -1 : 1;
    }
    return memo[*pa-'A'][*pb-'A'];
}

int main()
{
    char data[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int n,q,i;

    scanf("%d %d", &n, &q);

    qsort(data, n, sizeof(char), compare_char);

    printf("! %.*s\n", n, data);
    fflush(stdout);

    return 0;
}