%{
#include <bits/stdc++.h>
#include "y.tab.h"
using namespace std;
#include "src/SymbolTable.h"
int yylex();
extern FILE *yyin;
extern int yylineno;
//Error Handling
void yyerror (const char *s) {fprintf (stderr, "\033[0;31mLine:%d | %s\n\033[0m\n",yylineno, s);} 
vector <string> lhs;
vector <string> rhs;
%}

%start StartFile

%union {
     char *sval;
	 int nval;
}

%token T_PACKAGE T_IMPORT T_FUNC T_BREAK T_CONST T_CONTINUE T_PRINT
%token T_ELSE T_FOR T_IF T_RETURN T_VAR T_VAR_TYPE
%token T_BOOL_CONST T_IDENTIFIER T_STRING T_NIL_VAL
%token T_INCREMENT T_DECREMENT 
%token T_INTEGER
%token T_FLOAT

%left T_ADD T_MINUS T_MULTIPLY T_DIVIDE T_MOD
%right T_ASSIGN T_NOT
%left T_LAND T_LOR T_EQL T_NEQ T_LEQ T_GEQ T_SEMICOLON
%left T_GTR T_LSR T_LEFTPARANTHESES T_RIGHTPARANTHESES T_LEFTBRACE T_RIGHTBRACE T_LEFTBRACKET T_RIGHTBRACKET T_COMMA T_PERIOD

%type <sval> StartFile Expression 
%type <sval> Block StatementList Statement SimpleStmt 
%type <sval> Signature Parameters ParameterList
%type <sval> TopLevelDecl TopLevelDeclList
%type <sval> FunctionDecl
%type <sval> FunctionCall ForStmt ArgumentList
%type <sval> PrimaryExpr
%type <sval> ExpressionList 
%type <sval> Operand BasicLit IfStmt
%type <sval> PackageName ImportDecl ImportDeclList ImportSpecList Declaration
%type <sval> bin_op math_op rel_op
%type <sval> PrintStmt

%% 

StartFile:
    T_PACKAGE PackageName ImportDeclList TopLevelDeclList {};

Block:
	T_LEFTBRACE StatementList T_RIGHTBRACE {}
	| /*empty*/ {}; 

StatementList:
    StatementList Statement T_SEMICOLON {}
    | Statement T_SEMICOLON {}
	| StatementList Statement {}
    | Statement{};

Statement:
	Declaration {}
	| SimpleStmt {}
	| Block {}
	| IfStmt {}
	| ForStmt {} 
	| PrintStmt {}
	| FunctionCall {};

SimpleStmt:
	Expression T_INCREMENT {}
	| Expression T_DECREMENT {} 
	| ExpressionList assign_op ExpressionList {}
	| /*empty*/{};
	
Declaration:
	T_CONST T_IDENTIFIER Type T_ASSIGN Expression {}
	| T_CONST T_IDENTIFIER Type {}
	| T_VAR IdentifierList Type T_ASSIGN ExpressionList {}
	| T_VAR IdentifierList Type {};

PrintStmt:
	T_PRINT T_LEFTPARANTHESES T_STRING T_RIGHTPARANTHESES {};

FunctionDecl:
	T_FUNC T_IDENTIFIER Signature Block {};

FunctionCall:	
		PrimaryExpr T_LEFTPARANTHESES ArgumentList T_RIGHTPARANTHESES {};		

ArgumentList:	
		ArgumentList T_COMMA Arguments {}
		| Arguments {}
		| /*empty*/{};

//Accounts for function call as Arguement can remove that part if need :)
Arguments:	PrimaryExpr {}
		| FunctionCall {};

Signature:
	Parameters {}
	| Parameters Type {};

Parameters:
	T_LEFTPARANTHESES ParameterList T_RIGHTPARANTHESES {};

ParameterList:
	IdentifierList Type {}
	| ParameterList T_COMMA IdentifierList Type {}
	| /*empty*/ {};

IdentifierList:
	IdentifierList T_COMMA T_IDENTIFIER {;} 
	| T_IDENTIFIER {;};

TopLevelDeclList:
    TopLevelDeclList TopLevelDecl  {}
	| TopLevelDeclList T_SEMICOLON TopLevelDecl  {}
    | TopLevelDecl  {};

TopLevelDecl:
	Declaration {}	
	| FunctionDecl {};

Type:
	T_VAR_TYPE {}
	| T_FUNC Signature {};

Operand:
	BasicLit {}
	| T_IDENTIFIER {}
	| T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES {};

IfStmt:
	T_IF Expression Block {}
	| T_IF Expression Block T_ELSE IfStmt {}
	| T_IF Expression Block T_ELSE  Block {};

ForStmt: 
  T_FOR SimpleStmt T_SEMICOLON Expression T_SEMICOLON SimpleStmt Block {};

ExpressionList:
	ExpressionList T_COMMA Expression {}
	| Expression {};

BasicLit:
	T_INTEGER {}
	| T_FLOAT {}
	| T_STRING {}
	| T_BOOL_CONST {};

PrimaryExpr:
	Operand {}
	| PrimaryExpr Selector {};

Selector:
	T_PERIOD T_IDENTIFIER {};

Expression:
	Expression math_op Expression {}
	| Expression rel_op Expression {}
	| Expression bin_op Expression {}
	| unary_op Operand {}
	| Operand {};

bin_op:
	T_LOR {}
	| T_LAND {};

rel_op:
	T_EQL {}
	| T_NEQ {}
	| T_LSR {}
	| T_LEQ {}
	| T_GTR {}
	| T_GEQ {};

math_op:
	T_ADD {}
	| T_MINUS {}
	| T_MULTIPLY {}
	| T_DIVIDE {}
	| T_MOD {};

unary_op:
	T_ADD {}
	| T_MINUS {}
	| T_NOT {};

assign_op:
	T_ASSIGN {};

PackageName:
	T_IDENTIFIER {}
	| T_STRING {}
	| T_STRING T_SEMICOLON {};
	
//Can be list of imports, single import or no imports. Imports from local paths not accounted for.

ImportDeclList:
      ImportDeclList ImportDecl {}
    | ImportDecl {}
    | /*empty*/ {};

ImportDecl:
	T_IMPORT PackageName {}
	| T_IMPORT T_LEFTPARANTHESES ImportSpecList T_RIGHTPARANTHESES {};

ImportSpecList:
	ImportSpecList PackageName {}
	| PackageName {};

%%

int main (int argc, char** argv) {	
	printf("Inside main\n");
	FILE * fp= fopen(argv[1], "r");
	yyin = fp;
	printf("Read the input file, continue with Lexing and Parsing\n");
	printf("Performing Lexical analysis......\n\n");
	yyparse ( );
	printf("\n\033[0;32mParsing completed.\033[0m\n\n");
	printf("Symbol Table after Lexical Analysis: \n");
	Display();
	reverse(lhs.begin(),lhs.end());
	reverse(rhs.begin(),rhs.end());
    FILE *fptr;
    fptr = fopen("grammar_output.txt", "w+");
    if (fptr == NULL) {
        printf("Error!");
        exit(1);
    }
	else{
		for(int i=0;i<lhs.size();i++){
			fprintf(fptr, "%s -> %s \n", lhs[i].c_str(),rhs[i].c_str());
	}
	}
	fclose(fptr);
	return 0;
}