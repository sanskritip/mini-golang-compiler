%{
  #include <bits/stdc++.h>
  
  using namespace std;
  
//Stuff
 int yylex();
 extern int yylineno;

//Error Handling
void yyerror (const char *s) {fprintf (stderr, "\033[0;31mLine:%d | %s\n\033[0m\n",yylineno, s);} 
  extern FILE *yyin;
%}

%start StartFile

%code requires{
    #include "ast.h"
}

%union {
     char *sval;
	 int nval;
     AST* node;
}

//To access yyloc
%locations

%token <sval> T_PACKAGE T_IMPORT T_FUNC T_BREAK T_CONST T_CONTINUE T_PRINT
%token <sval> T_ELSE T_FOR T_IF T_RETURN T_VAR T_VAR_TYPE
%token <sval> T_BOOL_CONST T_IDENTIFIER T_STRING T_NIL_VAL
%token <sval> T_INTEGER 
%token <sval> T_FLOAT
%token <sval>  T_INCREMENT T_DECREMENT

%left <sval> T_ADD T_MINUS T_MULTIPLY T_DIVIDE T_MOD
%right <sval> T_ASSIGN T_NOT
%left <sval> T_LAND T_LOR T_EQL T_NEQ T_LEQ T_GEQ T_SEMICOLON
%left <sval> T_GTR T_LSR T_LEFTPARANTHESES T_RIGHTPARANTHESES T_LEFTBRACE T_RIGHTBRACE T_LEFTBRACKET T_RIGHTBRACKET T_COMMA T_PERIOD

%type <sval> unary_op bin_op math_op assign_op rel_op
%type <node> Expression Operand BasicLit ExpressionList Declaration SimpleStmt IfStmt

%% 

StartFile:
    T_PACKAGE PackageName ImportDeclList TopLevelDeclList {
	};

Block:
	T_LEFTBRACE StatementList T_RIGHTBRACE {}
	| /*empty*/ {}; 

StatementList:
    StatementList Statement T_SEMICOLON {}
    | Statement T_SEMICOLON {}
	| StatementList Statement {}
    | Statement {};

Statement:
	Declaration {}
	| SimpleStmt 
	{
		for(int i=0;i<25;i++) cout << "-"; 
		cout << "Generated AST in Tree format";
		for(int i=0;i<26;i++) cout << "-";
		cout<<endl;
		printTree($1, nullptr, false);
		for(int i=0;i<80;i++) cout << "-"; cout<<endl;
	}
	| Block {}
	| IfStmt {
	}
	| ForStmt {} 
	| PrintStmt {};

SimpleStmt:
	Expression assign_op Expression { $<node>$  = createNode($<sval>2,$1,$3);} 
	| Expression T_INCREMENT {}
	| Expression T_DECREMENT {} 
	| ExpressionList assign_op ExpressionList {
		// b,c = 2,3
	}
	| /*empty*/{};
	
Declaration:
	T_VAR Expression Type assign_op ExpressionList {$<node>$  = createNode($<sval>4,$2,$5);}
    | T_VAR Expression Type {};
    | T_CONST Expression Type assign_op ExpressionList {$<node>$  = createNode($<sval>4,$2,$5);}
    | T_CONST Expression Type {};
    ;

PrintStmt:
	T_PRINT T_LEFTPARANTHESES T_STRING T_RIGHTPARANTHESES {};

FunctionDecl:
	T_FUNC T_IDENTIFIER T_LEFTPARANTHESES T_RIGHTPARANTHESES Block {};


TopLevelDeclList:
    TopLevelDeclList TopLevelDecl  {}
	| TopLevelDeclList T_SEMICOLON TopLevelDecl  {}
    | TopLevelDecl  {};

TopLevelDecl:
	Declaration {}	
	| FunctionDecl {};

Type:
	T_VAR_TYPE {
	};

Operand:
	BasicLit {$<node>$ = $1;}
	| T_IDENTIFIER {$<node>$ = createNode($<sval>1,NULL,NULL);}
	| T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES {$<node>$ = $2;};


IfStmt:
	T_IF Expression Block {
    //Havent't added stuff
	}
    | T_IF Expression Block T_ELSE  Block {
	}
	| T_IF Expression Block T_ELSE IfStmt {
	}
	;

ForStmt: 
  T_FOR SimpleStmt{} T_SEMICOLON Expression{} T_SEMICOLON SimpleStmt{} Block{} {
  };

ExpressionList:
	Expression {$<node>$=$1;};

BasicLit:
	T_INTEGER {$<node>$ = createNode($<sval>1,0,0);}
	| T_FLOAT {$<node>$ = createNode($<sval>1,0,0);}
	| T_STRING {$<node>$ = createNode($<sval>1,0,0);}
	| T_BOOL_CONST {$<node>$ = createNode($<sval>1,0,0);
	};

Expression:
	Expression math_op Expression{
        $<node>$ =createNode($<sval>2, $<node>1, $<node>3);}
	| Expression rel_op Expression{
        $<node>$ =createNode($<sval>2, $<node>1, $<node>3);
	}
	| Expression bin_op Expression {
		$<node>$ =createNode($<sval>2, $<node>1, $<node>3);
	}
	| unary_op Operand {$$=$2;}
	| Operand {$$=$1;};

bin_op:
	T_LOR {$$="||";}
	| T_LAND {$$="&&";};

rel_op:
	T_EQL {$$="==";}
	| T_NEQ {$$="!=";}
	| T_LSR {$$="<";}
	| T_LEQ {$$="<=";}
	| T_GTR {$$=">";}
	| T_GEQ {$$=">=";};

math_op:
	T_ADD {$$="+";}
	| T_MINUS {$$="-";}
	| T_MULTIPLY {$$="*";}
	| T_DIVIDE {$$="/";}
	| T_MOD {$$="%";};

unary_op:
	T_ADD {$$="+";}
	| T_MINUS {$$="-";}
	| T_NOT {$$="~";};

assign_op:
	T_ASSIGN {$$="=";};

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
    cout << endl;
	return 0;
}