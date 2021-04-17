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