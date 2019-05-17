#include <stdio.h>
#include <string.h>

#define STR_MAX 100
#define MAX_NODE 500001

// �m�[�h�^��`
typedef struct _NODE{
    int key;
    struct _NODE *right;
    struct _NODE *left;
} NODE;

// �m�[�h�pRAM�Ǘ�
NODE node_pool[MAX_NODE];
int node_cnt;
NODE *make_node(int key);
void release_node(NODE *node);

// �c���[����
NODE *insert_node(NODE *root,int k);
void print_tree(NODE *root);
void print_tree_inorder(NODE *node);
void print_tree_preorder(NODE *node);
NODE *find_node(NODE *root,int k);
void delete_node(NODE **root,int k);

/////////////////////////////
// ���C������
int main(){
    int i;
    int m,k;
    NODE *root;
    char buf[STR_MAX];

    node_cnt = 0;
    root = NULL;

    // ���ߐ���ǂݍ���Ń��[�v
    scanf("%d%*c",&m);
    for( i=0; i<m; i++){
        // ���߂�ǂݍ���ŏ���
        fgets(buf,STR_MAX,stdin);
        if(strncmp(buf,"insert",6)==0){
            // insert
            sscanf(buf,"%*s %d",&k);
            root = insert_node(root,k);
        }else if(strncmp(buf,"print",5)==0){
            // print
            print_tree(root);
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
            //�����Ȃ�
        }
    }

    return 0;
}


/////////////////////////////
// �c���[����

// �v�f�ǉ�
// �c���[�̃��[�g��Ԃ�
NODE *insert_node(NODE *root,int k){
    NODE *new_root = root;
    NODE *y = NULL; // x �̐e
    NODE *x = root;
    NODE *z = make_node(k);

    while( x != NULL ){
        y = x; // �e��ݒ�
        if( z->key < x->key ){
            x = x->left; // ���̎q�ֈړ�
        }else{
            x = x->right; // �E�̎q�ֈړ�
        }
    }

    if( y == NULL){ // T ����̏ꍇ
        new_root = z;
    }else if( z->key < y->key){
        y->left = z; // z �� y �̍��̎q�ɂ���
    }else{
        y->right = z; // z �� y �̉E�̎q�ɂ���
    }

    return new_root;
}

// ���e�\��
void print_tree(NODE *root){
    print_tree_inorder(root);
    printf("\n");
    print_tree_preorder(root);
    printf("\n");
}
// ���ԏ�����
void print_tree_inorder(NODE *node){
    if(node==NULL) return;
    print_tree_inorder(node->left);
    printf(" %d",node->key);
    print_tree_inorder(node->right);
}

// ��s������
void print_tree_preorder(NODE *node){
    if(node==NULL) return;
    printf(" %d",node->key);
    print_tree_preorder(node->left);
    print_tree_preorder(node->right);
}

// �w��̃L�[�̃m�[�h��Ԃ�
// ������Ȃ����NULL��Ԃ�
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

// �w��̃L�[�̃m�[�h���폜����
void delete_node(NODE **root,int k){
    NODE **ref;
    ref = root;

    while( (*ref != NULL) && ((*ref)->key != k) ){
        if((*ref)->key < k){
            ref = &((*ref)->right);
        }else{
            ref = &((*ref)->left);
        }
    }

    while(*ref != NULL){
        if( (*ref)->left != NULL ){
            (*ref)->key = (*ref)->left->key;
            ref     = &((*ref)->left);
        }else if( (*ref)->right != NULL ){
            (*ref)->key = (*ref)->right->key;
            ref     = &((*ref)->right);
        }else{
            release_node(*ref);
            *ref = NULL;
        }
    }
}

//////////////////////
//�m�[�h�pRAM�Ǘ�

//�V�K�m�[�h�쐬
NODE *make_node(int key){
    NODE *node = &node_pool[node_cnt];
    node_cnt++;
    node->key   = key;
    node->right = NULL;
    node->left  = NULL;
    return node;
}

//�����m�[�h�폜�i����������j
void release_node(NODE *node){
}
