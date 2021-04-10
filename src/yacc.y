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

//splitting strings separated by comma
vector<string> split(const string &s, char delim) {
    stringstream ss(s);
    string item;
    vector<string> tokens;
    while (getline(ss, item, delim)) {
        tokens.push_back(item);
    }
    return tokens;
}

%}

%code requires{
	//For non terminals
	typedef struct{
		char *value;
	} node;
}

%union {
     char *sval;
	 int nval;
	 node* nt;
}

%start StartFile

%token <sval> T_PACKAGE T_IMPORT T_FUNC T_BREAK T_CONST T_CONTINUE
%token <sval> T_ELSE T_FOR T_IF T_RETURN T_VAR T_VAR_TYPE
%token <sval> T_BOOL_CONST T_IDENTIFIER T_STRING T_NIL_VAL
%token <sval> T_INCREMENT T_DECREMENT 
%token <sval> T_INTEGER
%token <sval> T_FLOAT

%left <sval> T_ADD T_MINUS T_MULTIPLY T_DIVIDE T_MOD
%right <sval> T_ASSIGN T_NOT
%left <sval> T_LAND T_LOR T_EQL T_NEQ T_LEQ T_GEQ T_SEMICOLON
%left <sval> T_GTR T_LSR T_LEFTPARANTHESES T_RIGHTPARANTHESES T_LEFTBRACE T_RIGHTBRACE T_LEFTBRACKET T_RIGHTBRACKET T_COMMA T_PERIOD

%type <nt> StartFile Expression Expression1 Expression2 Expression3 Expression4 Expression5 
%type <nt> Block StatementList Statement SimpleStmt 
%type <nt> Signature Result Parameters ParameterList ParameterDecl
%type <nt> TopLevelDecl TopLevelDeclList
%type <nt> ReturnStmt 
%type <nt> FunctionDecl FunctionName TypeList
%type <nt> Function FunctionBody FunctionCall ForStmt ArgumentList
%type <nt> UnaryExpr PrimaryExpr
%type <nt> ExpressionList assign_op rel_op add_op mul_op unary_op
%type <nt> Operand Literal BasicLit IfStmt
%type <nt> PackageClause PackageName ImportDecl ImportDeclList ImportSpecList Declaration
%type <nt> Type
%type <nt> IdentifierList

%% 

StartFile:
    PackageClause ImportDeclList TopLevelDeclList {
		printf("Parsed Start of program file.");
    	lhs.push_back("StartFile");rhs.push_back("PackageClause ImportDeclList TopLevelDeclList");
    };

Block:
	T_LEFTBRACE StatementList T_RIGHTBRACE{lhs.push_back("Block");rhs.push_back("T_LEFTBRACE StatementList T_RIGHTBRACE");}
	/*empty*/{lhs.push_back("Empty Block");rhs.push_back("/*empty*/");
	$$=$2; //Statement List at 2nd pos
	//cout << "Statement List" << $2 <<endl; //Gives no significant output
	}; 

StatementList:
    StatementList Statement T_SEMICOLON {lhs.push_back("StatementList");rhs.push_back("StatementList Statement T_SEMICOLON");}
    | Statement T_SEMICOLON {lhs.push_back("StatementList");rhs.push_back("Statement T_SEMICOLON");
	$$=$1; //Statement at pos 1
	}
	| StatementList Statement {lhs.push_back("StatementList");rhs.push_back("StatementList Statement ");}
    | Statement{lhs.push_back("StatementList");rhs.push_back("Statement ");
	$$=$1; //Statement at pos 1
	};

Statement:
	Declaration {lhs.push_back("Statement");rhs.push_back("Declaration");	$$=$1; /*Statement at  pos 1*/  }
	| SimpleStmt {lhs.push_back("Statement");rhs.push_back("SimpleStmt");	$$=$1; /*Statement at  pos 1*/  }
	| ReturnStmt {lhs.push_back("Statement");rhs.push_back("ReturnStmt"); $$=$1; /*Statement at  pos 1*/  }
	| Block {lhs.push_back("Statement");rhs.push_back("Block");	$$=$1; /*Statement at  pos 1*/  }
	| IfStmt {lhs.push_back("Statement");rhs.push_back("IfStmt");	$$=$1; /*Statement at  pos 1*/  }
	| ForStmt {lhs.push_back("Statement");rhs.push_back("ForStmt");	$$=$1; /*Statement at  pos 1*/  }
	| FunctionCall {lhs.push_back("Statement");rhs.push_back("FunctionCall");	$$=$1; /*Statement at  pos 1*/  };

SimpleStmt:
	Expression T_INCREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression INC");}
	| Expression T_DECREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression DEC");} 
	| ExpressionList assign_op ExpressionList
	{   lhs.push_back("Assignment"); rhs.push_back("ExpressionList assign_op ExpressionList");
		cout<<"Assignment"<<endl;
		//cout<<"Type of "<< $1->value <<endl;
		/*
		// a,b = 2,3
		string lhs_str = $1->value;
		vector <string> lhs_expr = split(lhs_str, ',');
		string rhs_str = $3->value;
		vector <string> rhs_expr = split(rhs_str, ',');
		//Checking if No. of expr of LHS=RHS is assignment stmt
		if(rhs_expr.size()!= lhs_expr.size()){
			cout<<"ERROR : Unequal # of expressions on LHS "<<lhs_expr.size()<<" & RHS "<<rhs_expr.size()<<endl;
		}
		else cout<<"Equal expressions on both sides of Assignment operator"<<endl;
		*/
	}
	| /*empty*/{lhs.push_back("EmptyStmt");rhs.push_back("/*empty*/");};
	
Declaration:
	T_CONST T_IDENTIFIER Type T_ASSIGN Expression {lhs.push_back("ConstDecl");rhs.push_back("T_CONST T_IDENTIFIER T_Type T_ASSIGN Expression");}
	| T_CONST T_IDENTIFIER Type {lhs.push_back("ConstDecl");rhs.push_back("T_CONST T_IDENTIFIER Type");}
	| T_VAR IdentifierList Type T_ASSIGN ExpressionList {lhs.push_back("VarDecl");rhs.push_back("T_VAR IdentifierList T_Type T_ASSIGN ExpressionList");
		cout << "Variable initialisation" <<endl;
		/*
		string temp_str = $2->value;
		temp_str.append("=");
		temp_str.append($4);
		(*$$).value = strdup(temp_str.c_str());
		cout << temp_str.c_str() <<endl;
		*/

	}
	| T_VAR IdentifierList Type {lhs.push_back("VarDecl");rhs.push_back("T_VAR IdentifierList Type");
	 //cout << $2->value;
	 $$=$2;
	 cout << "Variable declaration " << $$->value<< endl;
	 cout << $$ <<endl;;
	};

FunctionDecl:
		T_FUNC FunctionName Function  {lhs.push_back("FunctionDecl");rhs.push_back("T_FUNC FunctionName Function");}
		| T_FUNC FunctionName Signature {lhs.push_back("FunctionDecl");rhs.push_back("T_FUNC FunctionName Signature");};

FunctionName:
		T_IDENTIFIER {lhs.push_back("FunctionName");rhs.push_back("T_IDENTIFIER");};

Function:
		Signature FunctionBody {lhs.push_back("Function");rhs.push_back("Signature FunctionBody");};

FunctionBody:		
		Block {lhs.push_back("FunctionBody");rhs.push_back("Block");};

FunctionCall:	
		PrimaryExpr T_LEFTPARANTHESES ArgumentList T_RIGHTPARANTHESES {lhs.push_back("FunctionCall");rhs.push_back("PrimaryExpr T_LEFTPARANTHESES ArgumentList T_RIGHTPARANTHESES");};		

ArgumentList:	
		ArgumentList T_COMMA Arguments {lhs.push_back("ArgumentList");rhs.push_back("ArgumentList T_COMMA Arguments");}
		| Arguments {lhs.push_back("ArgumentList");rhs.push_back("Arguments");}//{printf("function's arguments ---2");}
		| /*empty*/{lhs.push_back("ArgumentList");rhs.push_back("/*empty*/");};

//Accounts for function call as Arguement can remove that part if need :)
Arguments:	PrimaryExpr {lhs.push_back("Arguments");rhs.push_back("PrimaryExpr");}//{printf("------------");}
		| FunctionCall {lhs.push_back("Arguments");rhs.push_back("FunctionCall");};

Signature:
	Parameters {lhs.push_back("Signature");rhs.push_back("Parameters");}
	| Parameters Result {lhs.push_back("Signature");rhs.push_back("Parameters Result");};

//Multiple return types
Result:
	T_LEFTPARANTHESES TypeList T_RIGHTPARANTHESES {lhs.push_back("Result");rhs.push_back("T_LEFTPARANTHESES TypeList T_RIGHTPARANTHESES");}
	| Type  {lhs.push_back("Result");rhs.push_back("Type");};

Parameters:
	T_LEFTPARANTHESES ParameterList T_RIGHTPARANTHESES {lhs.push_back("Parameters");rhs.push_back("T_LEFTPARANTHESES ParameterList T_RIGHTPARANTHESES");};

ParameterList:
	ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterDecl");}
	| ParameterList T_COMMA ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterList T_COMMA ParameterDecl");}
	| /*empty*/{lhs.push_back("ArgumentList");rhs.push_back("/*empty*/");};

ParameterDecl:
	IdentifierList Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList Type");};

TypeList:
    TypeList T_COMMA Type {lhs.push_back("TypeList");rhs.push_back("TypeList T_COMMA Type");}
    | Type {lhs.push_back("TypeList");rhs.push_back("Type");};



IdentifierList:
	IdentifierList T_COMMA T_IDENTIFIER {
		string temp_str = $1->value;
		temp_str.append(",");
		temp_str.append($3);
		(*$$).value = strdup(temp_str.c_str());
		cout << "Identifier List value "<<temp_str.c_str() <<endl;
	;} 
	| T_IDENTIFIER {
		(*$$).value=strdup($1);
		$1=(*$$).value;
		cout << "Identifier value "<<$1 <<endl;
	};

TopLevelDeclList:
     TopLevelDeclList /*here colon*/ TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList TopLevelDecl");}|
	 TopLevelDeclList T_SEMICOLON /*here colon*/ TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList T_SEMICOLON  TopLevelDecl");}
    | TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDecl");};

TopLevelDecl:
	Declaration {lhs.push_back("TopLevelDecl");rhs.push_back("Declaration");}	
	| FunctionDecl {lhs.push_back("TopLevelDecl");rhs.push_back("FunctionDecl");};

//No custom defined types

Type:
	T_VAR_TYPE {lhs.push_back("TypeName");rhs.push_back("T_VAR_TYPE");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_FUNC Signature {lhs.push_back("Type");rhs.push_back("TypeLit");};

Operand:
	Literal {lhs.push_back("Operand");rhs.push_back("Literal"); 
	$$=$1;
	}
	| T_IDENTIFIER {lhs.push_back("Operand");rhs.push_back("T_IDENTIFIER");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES {lhs.push_back("Operand");rhs.push_back("T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES");};

//Void return or Returning and Expression
ReturnStmt:
	T_RETURN Expression {lhs.push_back("ReturnStmt");rhs.push_back("T_RETURN Expression");}
	| T_RETURN {lhs.push_back("ReturnStmt");rhs.push_back("T_RETURN");};

//If , If-else , if-else-if
IfStmt:
	T_IF Expression Block {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block");}//{printf("T_IF case 1");}
	| T_IF Expression Block T_ELSE IfStmt {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block T_ELSE IfStmt");}//{printf("T_IF case 5");}
	| T_IF Expression Block T_ELSE  Block {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block T_ELSE  Block");}//{printf("T_IF case 6");};

ForStmt: 
  T_FOR SimpleStmt T_SEMICOLON Expression T_SEMICOLON SimpleStmt Block {lhs.push_back("ForStmt");rhs.push_back("T_FOR SimpleStmt T_SEMICOLON Condition T_SEMICOLON SimpleStmt Block");};

ExpressionList:
		ExpressionList T_COMMA Expression {lhs.push_back("ExpressionList");rhs.push_back("ExpressionList T_COMMA Expression");}
		| Expression {lhs.push_back("ExpressionList");rhs.push_back("Expression");
		$$=$1; //Expression at pos 1
		};

Literal:
	BasicLit {lhs.push_back("Literal");rhs.push_back("BasicLit");
	$$=$1;
	}
	| FunctionLit {lhs.push_back("Literal");rhs.push_back("FunctionLit");};

BasicLit:
	T_INTEGER {lhs.push_back("BasicLit");rhs.push_back("T_INTEGER");
	cout <<"Operand " << $<nval>1 << endl;
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_FLOAT {lhs.push_back("BasicLit");rhs.push_back("T_FLOAT");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_STRING {lhs.push_back("BasicLit");rhs.push_back("T_STRING");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_BOOL_CONST {lhs.push_back("BasicLit");rhs.push_back("T_STRING");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	};

FunctionLit:
	T_FUNC Function {lhs.push_back("FunctionLit");rhs.push_back("T_FUNC Function");};

PrimaryExpr:
	Operand {lhs.push_back("PrimaryExpr");rhs.push_back("Operand");
	$$=$1;
	}|
	PrimaryExpr Selector {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Selector");};

Selector:
	T_PERIOD T_IDENTIFIER {lhs.push_back("Selector");rhs.push_back("T_PERIOD T_IDENTIFIER");};

Expression:
    Expression1 {lhs.push_back("Expression");rhs.push_back("Expression1");
	$$=$1;
	};

Expression1:
    Expression1 T_LOR Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression1 T_LOR Expression2");}
    | Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression2");
	$$=$1;
	};
Expression2:
    Expression2 T_LAND Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression2 T_LAND Expression3");}
    | Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression3");
	$$=$1;
	};

Expression3:
    Expression3 rel_op Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression3 rel_op Expression4");}
    | Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression4");
	$$=$1;
	};

Expression4:
    Expression4 add_op Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression4 add_op Expression5");}
    | Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression5");
	$$=$1;
	};

Expression5:
    Expression5 mul_op PrimaryExpr {lhs.push_back("Expression5");rhs.push_back("Expression5 mul_op PrimaryExpr");}
    | UnaryExpr {lhs.push_back("Expression5");rhs.push_back("UnaryExpr");
	$$=$1;
	};

UnaryExpr:
	PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("PrimaryExpr");
	$$=$1;
	}
	| unary_op PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("unary_op PrimaryExpr");
	};

rel_op:
	T_EQL {lhs.push_back("rel_op");rhs.push_back("T_EQL");}
	| T_NEQ {lhs.push_back("rel_op");rhs.push_back("T_NEQ");}
	| T_LSR {lhs.push_back("rel_op");rhs.push_back("T_LSR");}
	| T_LEQ {lhs.push_back("rel_op");rhs.push_back("T_LEQ");}
	| T_GTR {lhs.push_back("rel_op");rhs.push_back("T_GTR");}
	| T_GEQ {lhs.push_back("rel_op");rhs.push_back("T_GEQ");};

add_op:
	T_ADD {lhs.push_back("add_op");rhs.push_back("T_ADD");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_MINUS {lhs.push_back("add_op");rhs.push_back("T_SUB");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	};

mul_op:
	T_MULTIPLY {lhs.push_back("mul_op");rhs.push_back("T_MUL");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_DIVIDE {lhs.push_back("mul_op");rhs.push_back("T_QUO");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}
	| T_MOD {lhs.push_back("mul_op");rhs.push_back("T_REM");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	};

unary_op:
	T_ADD {lhs.push_back("unary_op");rhs.push_back("T_ADD");}
	| T_MINUS {lhs.push_back("unary_op");rhs.push_back("T_SUB");}
	| T_NOT {lhs.push_back("unary_op");rhs.push_back("T_NOT");};

assign_op:
	T_ASSIGN {lhs.push_back("assign_op");rhs.push_back("T_ASSIGN");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	};

//Package Related

PackageClause:
	/*PACKAGE*/T_PACKAGE PackageName {lhs.push_back("PackageClause");rhs.push_back("T_PACKAGE PackageName");};

PackageName:
	T_IDENTIFIER {lhs.push_back("PackageName");rhs.push_back("T_IDENTIFIER");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}|
	T_STRING {lhs.push_back("PackageName");rhs.push_back("T_STRING");
	(*$$).value=strdup($1);
	$1=(*$$).value;
	}	|
	T_STRING T_SEMICOLON {lhs.push_back("PackageName");rhs.push_back("T_STRING T_SEMICOLON");};
	
//Can be list of imports, single import or no imports. Imports from local paths not accounted for.

ImportDeclList:
      ImportDeclList ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDeclList ImportDecl");}//{ printf("got import list 1");}
    | ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDecl");}//{ printf("got import list 2"); }
    | /*empty*/ {lhs.push_back("ImportDeclList");rhs.push_back("/*empty*/");}//{ printf("got import list 3");};

ImportDecl:
	T_IMPORT PackageName {lhs.push_back("ImportDecl");rhs.push_back("T_IMPORT PackageName T_SEMICOLON");}//{printf("got imports 1");}
	| T_IMPORT T_LEFTPARANTHESES ImportSpecList  T_RIGHTPARANTHESES {lhs.push_back("ImportDecl");rhs.push_back("T_IMPORT T_LEFTPARANTHESES ImportSpecList  T_RIGHTPARANTHESES");}//{printf("got imports 2");};

ImportSpecList:
	ImportSpecList PackageName {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpecList PacakageName T_SEMICOLON");}
	| PackageName {lhs.push_back("ImportSpecList");rhs.push_back("PackageName T_SEMICOLON");};

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