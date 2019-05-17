#include <stdio.h>
#include <string.h>

#define STR_MAX 100
#define MAX_NODE 500001

// ノード型定義
typedef struct _NODE{
    int key;
    struct _NODE *right;
    struct _NODE *left;
} NODE;

// ノード用RAM管理
NODE node_pool[MAX_NODE];
int node_cnt;
NODE *make_node(int key);
void release_node(NODE *node);

// ツリー操作
NODE *insert_node(NODE *root,int k);
void print_tree(NODE *root);
void print_tree_inorder(NODE *node);
void print_tree_preorder(NODE *node);
NODE *find_node(NODE *root,int k);
NODE *delete_node(NODE *root,int k);

void my_print_tree(NODE *root);

/////////////////////////////
// メイン処理
int main(){
    int i;
    int m,k;
    NODE *root;
    char buf[STR_MAX];

    node_cnt = 0;
    root = NULL;

    // 命令数を読み込んでループ
    scanf("%d%*c",&m);
    for( i=0; i<m; i++){
        // 命令を読み込んで処理
        fgets(buf,STR_MAX,stdin);
        if(strncmp(buf,"insert",6)==0){
            // insert
            sscanf(buf,"%*s %d",&k);
            root = insert_node(root,k);
        }else if(strncmp(buf,"print",5)==0){
            // print
            print_tree(root);
            //my_print_tree(root);
        }else if(strncmp(buf,"find",4)==0){
            // find
            sscanf(buf,"%*s %d",&k);
            if(find_node(root,k)==NULL){
                printf("no\n");
            }else{
                printf("yes\n");
            }
        }else if(strncmp(buf,"delete",6)==0){
            // delete
            sscanf(buf,"%*s %d",&k);
            delete_node(&root,k);
        }else{
            //処理なし
        }
    }

//    my_print_tree(root);

    return 0;
}


/////////////////////////////
// ツリー操作

// 要素追加
// ツリーのルートを返す
NODE *insert_node(NODE *root,int k){
    NODE *new_root = root;
    NODE *y = NULL; // x の親
    NODE *x = root;
    NODE *z = make_node(k);

    while( x != NULL ){
        y = x; // 親を設定
        if( z->key < x->key ){
            x = x->left; // 左の子へ移動
        }else{
            x = x->right; // 右の子へ移動
        }
    }

    if( y == NULL){ // T が空の場合
        new_root = z;
    }else if( z->key < y->key){
        y->left = z; // z を y の左の子にする
    }else{
        y->right = z; // z を y の右の子にする
    }

    return new_root;
}

// 内容表示
void print_tree(NODE *root){
    print_tree_inorder(root);
    printf("\n");
    print_tree_preorder(root);
    printf("\n");
}
// 中間順巡回
void print_tree_inorder(NODE *node){
    if(node==NULL) return;
    print_tree_inorder(node->left);
    printf(" %d",node->key);
    print_tree_inorder(node->right);
}

// 先行順巡回
void print_tree_preorder(NODE *node){
    if(node==NULL) return;
    printf(" %d",node->key);
    print_tree_preorder(node->left);
    print_tree_preorder(node->right);
}

// 指定のキーのノードを返す
// 見つからなければNULLを返す
NODE *find_node(NODE *root,int k){
    NODE *next;
    if(root == NULL) return NULL;
    if(root->key == k) return root;
    if(root->key < k){
        next = root->right;
    }else{
        next = root->left;
    }

    return find_node(next,k);
}

// 指定のキーのノードを削除する
// ツリーのルートを返す
NODE *delete_node(NODE *root,int k){
    NODE **ref; // 削除対象を指すポインタの格納場所
    int  *ptkey;
    NODE *release_tmp;
    ref = root;

    // 削除対象の探索
    while( (*ref != NULL) && ((*ref)->key != k) ){
        if((*ref)->key < k){
            ref = &((*ref)->right);
        }else{
            ref = &((*ref)->left);
        }
    }

    // 条件に従いノード削除
    if(*ref != NULL){
        if( (*ref)->left != NULL ){
            if( (*ref)->right != NULL ){
                // 子を2つ持つ場合
                // 中間順巡回で隣＝右の子の左端　のキーをコピーしてから削除
                ptkey = &((*ref)->key);
                ref = &((*ref)->right);
                while( (*ref)->left ){
                    ref = &((*ref)->left);
                }
                *ptkey = (*ref)->key;
                delete_node( ref, (*ref)->key );
            }else{
                // 左の子のみもつ場合
                release_tmp = *ref;
                *ref = (*ref)->left;
                release_node(release_tmp);
            }
        }else if( (*ref)->right != NULL ){
            // 右の子のみ持つ場合
            release_tmp = *ref;
            *ref = (*ref)->right;
            release_node(release_tmp);
        }else{
            // 子を持たない場合
            release_node(*ref);
            *ref = NULL;
        }
    }
}

//////////////////////
//ノード用RAM管理

//新規ノード作成
NODE *make_node(int key){
    NODE *node = &node_pool[node_cnt];
    node_cnt++;
    node->key   = key;
    node->right = NULL;
    node->left  = NULL;
    return node;
}

//既存ノード削除（メモリ解放）
void release_node(NODE *node){
}

// デバッグ用ツリー内容表示
void my_print_tree(NODE *root){
    static NODE *que[1000];
    int i,quecnt,validcnt;
    if(root == NULL)return;
    que[0] = root;
    quecnt = 1;
    validcnt = 1;
    while(validcnt){
        validcnt=0;
        for(i=0;i<quecnt;i++){
            if(que[i]!=NULL){
                printf("%d ",que[i]->key);
                validcnt++;
            }else{
                printf("* ");
            }
        }
        printf("\n");

        for(i=quecnt-1;i>=0;i--){
            if(que[i]!=NULL){
                que[i*2+1]=que[i]->right;
                que[i*2]=que[i]->left;
            }else{
                que[i*2+1]=que[i*2]=NULL;
            }
        }
        quecnt *= 2;
    }
}
