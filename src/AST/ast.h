#include <bits/stdc++.h>
using namespace std;

typedef struct AST
{
  	char *value;
  	struct AST *left;
  	struct AST *right;
} AST;

AST* createNode(char*, AST*,AST*);
void displayAST(AST *,int);