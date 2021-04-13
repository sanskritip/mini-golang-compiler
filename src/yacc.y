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

//Symbol Table Structure
typedef struct symbol_table
  {
    int line;
    char name[31];
    char type;
    char *value;
    char *datatype;
  }ST;
  int struct_index = 0;
  ST st[10000];
  char x[10];

  //Symbol Table functions
  void lookup(char *,int,char,char*,char* );
  //void insert(char *,int,char,char*,char* );
  void update(char *,int,char *);
  void search_id(char *,int );
  int get_val(char *token);

%}

%start StartFile

%union {
     char *sval;
	 int nval;
}

//To access yyloc
%locations

%token <sval> T_PACKAGE T_IMPORT T_FUNC T_BREAK T_CONST T_CONTINUE T_PRINT
%token <sval> T_ELSE T_FOR T_IF T_RETURN T_VAR T_VAR_TYPE
%token <sval> T_BOOL_CONST T_IDENTIFIER T_STRING T_NIL_VAL
%token <sval> T_INCREMENT T_DECREMENT 
%token <sval> T_INTEGER
%token <sval> T_FLOAT

%left <sval> T_ADD T_MINUS T_MULTIPLY T_DIVIDE T_MOD
%right <sval> T_ASSIGN T_NOT
%left <sval> T_LAND T_LOR T_EQL T_NEQ T_LEQ T_GEQ T_SEMICOLON
%left <sval> T_GTR T_LSR T_LEFTPARANTHESES T_RIGHTPARANTHESES T_LEFTBRACE T_RIGHTBRACE T_LEFTBRACKET T_RIGHTBRACKET T_COMMA T_PERIOD

%type <sval> unary_op bin_op math_op assign_op rel_op
%type <sval> Expression Operand BasicLit ExpressionList IdentifierList Declaration
/*
%type StartFile Expression 
%type Block StatementList Statement SimpleStmt 
%type TopLevelDecl TopLevelDeclList
%type FunctionDecl
%type ForStmt
%type ExpressionList 
%type Operand BasicLit IfStmt
%type PackageName ImportDecl ImportDeclList ImportSpecList Declaration
%type bin_op math_op rel_op
%type PrintStmt
*/

%% 

StartFile:
    T_PACKAGE PackageName ImportDeclList TopLevelDeclList {
		lookup($1,@1.last_line,'K',NULL,NULL);
	};

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
	| PrintStmt {};

SimpleStmt:
	T_IDENTIFIER assign_op Expression {
		search_id($1,@1.last_line);lookup($2,@2.last_line,'O',NULL,NULL);update($1,@1.last_line,$3);
	}
	| Expression T_INCREMENT {
		int temp = get_val($1);
		search_id($1,@1.last_line);lookup($2,@2.last_line,'O',NULL,NULL);update($1,@1.last_line,(char *)to_string(temp+1).c_str());
	}
	| Expression T_DECREMENT {
		int temp = get_val($1);
		search_id($1,@1.last_line);lookup($2,@2.last_line,'O',NULL,NULL);update($1,@1.last_line,(char *)to_string(temp-1).c_str());
	} 
	| ExpressionList assign_op ExpressionList {
		// b,c = 2,3
	}
	| /*empty*/{};
	
Declaration:
	T_CONST T_IDENTIFIER Type T_ASSIGN Expression {lookup($1,@1.last_line,'K',NULL,NULL);}
	| T_CONST T_IDENTIFIER Type {lookup($1,@1.last_line,'K',NULL,NULL);}
	| T_VAR IdentifierList Type T_ASSIGN ExpressionList {lookup($2,@1.last_line,'I',NULL,$1);lookup($1,@1.last_line,'K',NULL,NULL);update($2,@2.last_line,$5);}
	| T_VAR IdentifierList Type { lookup($2,@1.last_line,'I',NULL,$1);lookup($2,@2.last_line,'K',NULL,NULL);
	};

PrintStmt:
	T_PRINT T_LEFTPARANTHESES T_STRING T_RIGHTPARANTHESES {lookup($1,@1.last_line,'K',NULL,NULL);
	};

FunctionDecl:
	T_FUNC T_IDENTIFIER T_LEFTPARANTHESES T_RIGHTPARANTHESES Block {
		lookup($1,@1.last_line,'K',NULL,NULL);
	};

IdentifierList:
	IdentifierList T_COMMA T_IDENTIFIER {;} 
	| T_IDENTIFIER {$$=$1;};

TopLevelDeclList:
    TopLevelDeclList TopLevelDecl  {}
	| TopLevelDeclList T_SEMICOLON TopLevelDecl  {}
    | TopLevelDecl  {};

TopLevelDecl:
	Declaration {}	
	| FunctionDecl {};

Type:
	T_VAR_TYPE {
		lookup($1,@1.last_line,'K',NULL,NULL);
	};

Operand:
	BasicLit {$$=$1;}
	| T_IDENTIFIER {$$=$1;}
	| T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES {};

IfStmt:
	T_IF Expression Block {
		lookup($1,@1.last_line,'K',NULL,NULL);
	}
	| T_IF Expression Block T_ELSE IfStmt {
		lookup($1,@1.last_line,'K',NULL,NULL);
		lookup($4,@4.last_line,'K',NULL,NULL);
	}
	| T_IF Expression Block T_ELSE  Block {
		lookup($1,@1.last_line,'K',NULL,NULL);
		lookup($4,@4.last_line,'K',NULL,NULL);
	};

ForStmt: 
  T_FOR SimpleStmt T_SEMICOLON Expression T_SEMICOLON SimpleStmt Block {
	  lookup($1,@1.last_line,'K',NULL,NULL);
  };

ExpressionList:
	ExpressionList T_COMMA Expression {}
	| Expression {$$=$1;};

BasicLit:
	T_INTEGER {lookup($1,@1.last_line,'C',NULL,NULL); $$=$1;}
	| T_FLOAT {lookup($1,@1.last_line,'C',NULL,NULL);}
	| T_STRING {lookup($1,@1.last_line,'C',NULL,NULL);}
	| T_BOOL_CONST {lookup($1,@1.last_line,'C',NULL,NULL);
	};

Expression:
	Expression math_op Expression 
	{
		lookup($2,@2.last_line,'O',NULL,NULL);
		cout << atoi($1)<<"Operator" <<$2<<atoi($3)<<endl;
		if(!strcmp($2,"+")){sprintf($$,"%d",atoi($1)+atoi($3));}
		if(!strcmp($2,"*")){sprintf($$,"%d",atoi($1)*atoi($3));}
	}
	| Expression rel_op Expression {lookup($2,@2.last_line,'O',NULL,NULL);}
	| Expression bin_op Expression {lookup($2,@2.last_line,'O',NULL,NULL);}
	| unary_op Operand {lookup($1,@1.last_line,'O',NULL,NULL);}
	| Operand { $$=$1; };

bin_op:
	T_LOR {$$=$1;}
	| T_LAND {$$=$1;};

rel_op:
	T_EQL {$$=$1;}
	| T_NEQ {$$=$1;}
	| T_LSR {$$=$1;}
	| T_LEQ {$$=$1;}
	| T_GTR {$$=$1;}
	| T_GEQ {$$=$1;};

math_op:
	T_ADD {$$=$1;}
	| T_MINUS {$$=$1;}
	| T_MULTIPLY {$$=$1;}
	| T_DIVIDE {$$=$1;}
	| T_MOD {$$=$1;};

unary_op:
	T_ADD {$$=$1;}
	| T_MINUS {$$=$1;}
	| T_NOT {$$=$1;};

assign_op:
	T_ASSIGN {$$=$1;};

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
	T_IMPORT PackageName {
		lookup($1,@1.last_line,'K',NULL,NULL);
	}
	| T_IMPORT T_LEFTPARANTHESES ImportSpecList T_RIGHTPARANTHESES {
		lookup($1,@1.last_line,'K',NULL,NULL);
	};

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
	//Display();
	printf("-----------------------------------Symbol Table-----------------------------------\n\n");
    printf("S.No\t  Token  \t Line Number \t Category \t DataType \t Value \n");
    for(int i = 0;i < struct_index;i++)
    {
      char *ty;
      
      if(st[i].type=='K')
        ty="keyword";
      else if(st[i].type=='I')
      {
        ty="identifier";
        printf("%-4d\t  %-7s\t   %-10d \t %-9s\t  %-7s\t   %-5s\n",i+1,st[i].name,st[i].line,ty,st[i].datatype,st[i].value);
      }
      else if(st[i].type=='C')
        ty="constant";
      else
        ty="operator";
      if(st[i].type!='I')
        printf("%-4d\t  %-7s\t   %-10d\t %-9s\t  NULL\t\t %-5s\n",i+1,st[i].name,st[i].line,ty,st[i].value);
    }
	return 0;
}

void lookup(char *token,int line,char type,char *value,char *datatype)
{
  //printf("Token %s line number %d\n",token,line);
  int flag = 0;
  for(int i = 0;i < struct_index;i++)
  {
    if(!strcmp(st[i].name,token))
    {
      flag = 1;
      if(st[i].line != line)
      {
        st[i].line = line;
      }
    }
  }
  
  //Insert
  if(flag == 0)
  {
    strcpy(st[struct_index].name,token);
    st[struct_index].type=type;
    if(value==NULL)
        st[struct_index].value=NULL;
    else
        strcpy(st[struct_index].value,value);
        
    if(datatype==NULL)
        st[struct_index].datatype=NULL;
    else
        st[struct_index].datatype=datatype;
        
    st[struct_index].line = line;
    struct_index++;
  }
}
/*
void insert(char *token,int line,char type, char* value, char *datatype)
{
  printf("start");
  strcpy(st[struct_index].name,token);
  st[struct_index].type=type;
  strcpy(st[struct_index].value,value);
  strcpy(st[struct_index].datatype,datatype);
  st[struct_index].line = line;
  struct_index++;
  printf("end");
}
*/
void search_id(char *token,int lineno)
{
  int flag = 0;
  for(int i = 0;i < struct_index;i++)
  {
    if(!strcmp(st[i].name,token))
    {
      flag = 1;
      return;
    }
  }
  if(flag == 0)
  {
    printf("Error at line %d : %s is not defined\n",lineno,token);
    exit(0);
  }
}

void update(char *token,int lineno,char *value)
{
  int flag = 0;
  
  for(int i = 0;i < struct_index;i++)
  {
    if(!strcmp(st[i].name,token))
    {
      flag = 1;
      st[i].value = (char*)malloc(sizeof(char)*strlen(value));
      //sprintf(st[i].value,"%s",value);
      strcpy(st[i].value,value);
      st[i].line = lineno;
      return;
    }
  }
  if(flag == 0)
  {
    printf("Error at line %d : %s is not defined\n",lineno,token);
    exit(0);
  }
}

int get_val(char *token)
{
  int flag = 0;
  for(int i = 0;i < struct_index;i++)
  {
    if(!strcmp(st[i].name,token))
    {
      flag = 1;
      return atoi(st[i].value);
    }
  }
  if(flag == 0)
  {
    printf("Error at line : %s is not defined\n",token);
    exit(0);
  }
}