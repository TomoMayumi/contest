#include <stdio.h>
#include <stdlib.h>

#define TRUE        1
#define FALSE       0

#define KIND_MAX    4


void init();
void deinit();
void insert(char *str);
int find(char *str);

static void free_dic(DIC *pdic);

typedef struct _dic{
    char exist;
    struct _dic *next[KIND_MAX];
} DIC;

DIC dic;

int main(){
    char cmd[7];
    char str[13];
    int n;
    int i;

    init();

    scanf("%d",&n);

    for(i=0;i<n;i++){
        scanf("%s %s",cmd,str);
        if(cmd[0]=='i'){
            /* cmd is "insert" */
            insert(str);
        }else{
            /* cmd is "find" */
            printf(find(str)?"yes\n":"no\n");
        }
    }

    deinit();

    return 0;
}

void init(){
    int i;
    for(i=0;i<KIND_MAX;i++)dic.next[i] = NULL;
    dic.exist = FALSE;
}

void deinit(){
    int i;
    for(i=0;i<KIND_MAX;i++){
        if(dic.next[i] != NULL){
            free_dic(dic.next[i]);
        }
    }
}

void insert(char *str){
    DIC *pdic;
    DIC *nextdic;
    int nextid;
    int i;

    pdic = &dic;

    while(*str!='\0'){
        switch(*str){
            case 'A': nextid = 0; break;
            case 'C': nextid = 1; break;
            case 'G': nextid = 2; break;
            case 'T': nextid = 3; break;
        }

        nextdic = pdic->next[nextid];

        if( nextdic == NULL ){
            nextdic = (DIC*)malloc(sizeof(DIC));
            for(i=0;i<KIND_MAX;i++)nextdic->next[i] = NULL;
            nextdic->exist = FALSE;

            pdic->next[nextid] = nextdic;
        }

        pdic = nextdic;
        str++;
    }

    pdic->exist = TRUE;
}

int find(char *str){
    DIC *pdic;
    int nextid;

    pdic = &dic;

    while(*str!='\0'){
        switch(*str){
            case 'A': nextid = 0; break;
            case 'C': nextid = 1; break;
            case 'G': nextid = 2; break;
            case 'T': nextid = 3; break;
        }

        pdic = pdic->next[nextid];
        if(pdic==NULL)break;
        str++;
    }

    return (*str=='\0')&&(pdic->exist);
}


static void free_dic(DIC *pdic){
    int i;
    for(i=0;i<KIND_MAX;i++){
        if(pdic->next[i] != NULL){
            free_dic(pdic->next[i]);
        }
    }
    free(pdic);
}
