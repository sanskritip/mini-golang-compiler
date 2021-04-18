#include "ast.h"

AST* createNode(char *value, AST *left,AST *right)
{
	AST *astNode = (AST*) malloc(sizeof(AST));

	astNode->left = left;
	astNode->right = right;
	astNode->value = strdup(value);

	return astNode;
}

void displayAST(AST *astNode, int space)
{
	if (astNode == NULL) 
        return; 
    space += 4; 
    // Process right child first 
    displayAST(astNode->left, space);  
    cout<<endl; 
    for (int i = 4; i < space; i++) 
        cout<<" "; 
    cout<<astNode->value<<"\n"; 
    // Process left child 
    displayAST(astNode->right, space); 
}
 
// Helper function to print branches of the binary tree
void showTrunks(Trunk *p)
{
    if (p == nullptr) {
        return;
    }
    showTrunks(p->prev);
    cout << p->str;
}
 
// Recursive function to print a binary tree.
// It uses the inorder traversal.
void printTree(AST* root, Trunk *prev, bool isLeft)
{
    if (root == nullptr) {
        return;
    }
    string prev_str = "    ";
    Trunk *trunk = new Trunk(prev, prev_str);
    printTree(root->right, trunk, true);
    if (!prev) {
        trunk->str = "——— ";
    }
    else if (isLeft)
    {
        trunk->str = ".—— ";
        prev_str = "    |";
    }
    else {
        trunk->str = "`——— ";
        prev->str = prev_str;
    }
    showTrunks(trunk);
    cout << BOLDGREEN << root->value << RESET << endl;
    if (prev) {
        prev->str = prev_str;
    }
    trunk->str = "   |";
    printTree(root->left, trunk, false);
}