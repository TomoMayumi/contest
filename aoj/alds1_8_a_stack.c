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

// �c���[����
NODE *insert_tree(NODE *root,int k);
void print_tree(NODE *root);
void print_tree_inorder(NODE *node);
void print_tree_preorder(NODE *node);

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
            root = insert_tree(root,k);
        }else if(strncmp(buf,"print",5)==0){
            // print
            print_tree(root);
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
NODE *insert_tree(NODE *root,int k){
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
    print_tree_preorder(root);
}
// ���ԏ�����
void print_tree_inorder(NODE *node){
    static NODE *stack_node[MAX_NODE*2];
    static int   stack_type[MAX_NODE*2];// 0:���� 1:�\��
    int sp;
    NODE *tmp_node;

    stack_node[0]=node;
    stack_type[0]=0;
    sp = 1;
    while(sp>0){
        sp--;
        tmp_node = stack_node[sp];
        if(tmp_node==NULL)continue;
        switch(stack_type[sp]){
            case 0: //����
                stack_node[sp]=tmp_node->right;
                stack_type[sp]=0; //����
                sp++;
                stack_node[sp]=tmp_node;
                stack_type[sp]=1; //�\��
                sp++;
                stack_node[sp]=tmp_node->left;
                stack_type[sp]=0; //����
                sp++;
                break;
            case 1: //�\��
                printf(" %d",tmp_node->key);
                break;
            default:
                break;
        }
    }
    printf("\n");
}

// ��s������
void print_tree_preorder(NODE *node){
    static NODE *stack[MAX_NODE];
    int sp;
    NODE *tmp_node;

    stack[0]=node;
    sp = 1;
    while(sp>0){
        tmp_node = stack[--sp];
        if(tmp_node==NULL)continue;
        stack[sp++]=tmp_node->right;
        stack[sp++]=tmp_node->left;
        printf(" %d",tmp_node->key);
    }
    printf("\n");
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

