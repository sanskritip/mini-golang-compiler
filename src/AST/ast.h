#include <bits/stdc++.h>
using namespace std;
#define RESET   "\033[0m"
#define BOLDGREEN   "\033[1m\033[32m"
typedef struct AST
{
  	char *value;
  	struct AST *left;
  	struct AST *right;
} AST;

AST* createNode(char*, AST*,AST*);
void displayAST(AST *,int);

struct Trunk
{
    Trunk *prev;
    string str;
 
    Trunk(Trunk *prev, string str)
    {
        this->prev = prev;
        this->str = str;
    }
};

void printTree(AST*, Trunk *, bool);
void showTrunks(Trunk *);

