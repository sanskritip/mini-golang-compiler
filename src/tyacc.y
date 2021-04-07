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
     char *nt;
     char *sval;
	 int ival;
}

%token <sval> T_PACKAGE T_IMPORT T_FUNC T_BREAK T_CONST T_CONTINUE
%token <sval> T_ELSE T_FOR T_GO T_IF T_RETURN T_STRUCT T_SWITCH T_TYPE T_VAR T_VAR_TYPE
%token <sval> T_BOOL_CONST T_NIL_VAL T_IDENTIFIER T_BYTE T_STRING T_ELLIPSIS
%token <sval> T_INCREMENT T_DECREMENT 
%token <sval> T_INTEGER
%token <sval> T_FLOAT

%left <sval> T_ADD T_MINUS T_MULTIPLY T_DIVIDE T_MOD
%right <sval> T_ASSIGN T_AND T_NOT
%left <sval> T_ARROW //Identifier
%right <sval> T_COLON
%left <sval> T_LAND T_LOR T_EQL T_NEQ T_LEQ T_GEQ T_SEMICOLON
%left <sval> T_GTR T_LSR T_LEFTPARANTHESES T_RIGHTPARANTHESES T_LEFTBRACE T_RIGHTBRACE T_LEFTBRACKET T_RIGHTBRACKET T_COMMA T_PERIOD

%type <nt> StartFile Expression 
%type <nt> Block StatementList Statement SimpleStmt 
%type <nt> EmptyStmt IncDecStmt 
%type <nt> Assignment Declaration ConstDecl 
%type <nt> Signature Result Parameters ParameterList ParameterDecl
%type <nt> ConstSpec TopLevelDecl TopLevelDeclList
%type <nt> ReturnStmt BreakStmt ContinueStmt
%type <nt> FunctionDecl FunctionName TypeList
%type <nt> Function FunctionBody FunctionCall ForStmt ForClause ArgumentList
%type <nt> Condition UnaryExpr PrimaryExpr
%type <nt> ExpressionList 
%type <nt> Operand Literal BasicLit OperandName ImportSpec IfStmt
%type <nt> PackageClause PackageName ImportDecl ImportDeclList ImportSpecList
%type <nt> TypeName
%% 

StartFile:
    PackageClause ImportDeclList TopLevelDeclList {
		printf("Parsed Start of program file.");
    	lhs.push_back("StartFile");rhs.push_back("PackageClause ImportDeclList TopLevelDeclList");
    };

Block:
	T_LEFTBRACE OPENB StatementList CLOSEB T_RIGHTBRACE{lhs.push_back("Block");rhs.push_back("T_LEFTBRACE StatementList T_RIGHTBRACE");}
	/*empty*/{lhs.push_back("Empty Block");rhs.push_back("/*empty*/");}; 

OPENB:
	/*empty*/{lhs.push_back("OPENB");rhs.push_back("/*empty*/");};
	
CLOSEB:
	/*empty*/{lhs.push_back("CLOSEB");rhs.push_back("/*empty*/");};

StatementList:
    StatementList Statement T_SEMICOLON {lhs.push_back("StatementList");rhs.push_back("StatementList Statement T_SEMICOLON");}
    | Statement T_SEMICOLON {lhs.push_back("StatementList");rhs.push_back("Statement T_SEMICOLON");}
	| StatementList Statement {lhs.push_back("StatementList");rhs.push_back("StatementList Statement ");}
    | Statement{lhs.push_back("StatementList");rhs.push_back("Statement ");};

Statement:
	Declaration {lhs.push_back("Statement");rhs.push_back("Declaration");}
	| SimpleStmt {lhs.push_back("Statement");rhs.push_back("SimpleStmt");}
	| ReturnStmt {lhs.push_back("Statement");rhs.push_back("ReturnStmt");}
	| BreakStmt {lhs.push_back("Statement");rhs.push_back("BreakStmt");}
	| ContinueStmt {lhs.push_back("Statement");rhs.push_back("ContinueStmt");}
	| Block {lhs.push_back("Statement");rhs.push_back("Block");}
	| IfStmt {lhs.push_back("Statement");rhs.push_back("IfStmt");}
	| ForStmt {lhs.push_back("Statement");rhs.push_back("ForStmt");} 
	| FunctionCall {lhs.push_back("Statement");rhs.push_back("FunctionCall");} ;

//All simple statements 

SimpleStmt:
	EmptyStmt {lhs.push_back("SimpleStmt");rhs.push_back("EmptyStmt");}
	| IncDecStmt {lhs.push_back("SimpleStmt");rhs.push_back("IncDecStmt");}
	| Assignment {lhs.push_back("SimpleStmt");rhs.push_back("Assignment");} ;

EmptyStmt:
	/*empty*/{lhs.push_back("EmptyStmt");rhs.push_back("/*empty*/");};

IncDecStmt:
	Expression T_INCREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression INC");}
	| Expression T_DECREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression DEC");};

Assignment:
	ExpressionList assign_op ExpressionList {lhs.push_back("Assignment");rhs.push_back("ExpressionList assign_op ExpressionList");};

Declaration:
	ConstDecl {lhs.push_back("Declaration");rhs.push_back("ConstDecl");}
	|VarDecl {lhs.push_back("Declaration");rhs.push_back("VarDecl");};

//Variable Declaration

VarDecl:
		T_VAR IdentifierList Type T_ASSIGN ExpressionList {lhs.push_back("VarDecl");rhs.push_back("T_VAR IdentifierList T_Type T_ASSIGN ExpressionList");}
		| T_VAR IdentifierList Type {lhs.push_back("VarDecl");rhs.push_back("T_VAR IdentifierList Type");};

ConstDecl:
		T_CONST T_IDENTIFIER Type T_ASSIGN Expression {lhs.push_back("ConstDecl");rhs.push_back("T_CONST T_IDENTIFIER T_Type T_ASSIGN Expression");}
		| T_CONST T_IDENTIFIER Type {lhs.push_back("ConstDecl");rhs.push_back("T_CONST T_IDENTIFIER Type");};

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

Result:
	T_LEFTPARANTHESES TypeList T_RIGHTPARANTHESES {lhs.push_back("Result");rhs.push_back("T_LEFTPARANTHESES TypeList T_RIGHTPARANTHESES");}
	| Type  {lhs.push_back("Result");rhs.push_back("Type");};

Parameters:
	T_LEFTPARANTHESES T_RIGHTPARANTHESES { lhs.push_back("Parameters");rhs.push_back("T_LEFTPARANTHESES T_RIGHTPARANTHESES");}//printf("gor T_func with no arguments");}
	| T_LEFTPARANTHESES ParameterList T_RIGHTPARANTHESES {lhs.push_back("Parameters");rhs.push_back("T_LEFTPARANTHESES ParameterList T_RIGHTPARANTHESES");}
	|T_LEFTPARANTHESES ParameterList T_COMMA T_RIGHTPARANTHESES {lhs.push_back("Parameters");rhs.push_back("T_LEFTPARANTHESES ParameterList T_COMMA T_RIGHTPARANTHESES");}; 

ParameterList:
	ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterDecl");}
	|ParameterList T_COMMA ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterList T_COMMA ParameterDecl");};

ParameterDecl:
	IdentifierList Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList Type");}
	| IdentifierList T_ELLIPSIS  Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList T_ELLIPSIS  Type");}
	| T_ELLIPSIS Type {lhs.push_back("ParameterDecl");rhs.push_back("T_ELLIPSIS Type");};

TypeList:
    TypeList T_COMMA Type {lhs.push_back("TypeList");rhs.push_back("TypeList T_COMMA Type");}
    | Type {lhs.push_back("TypeList");rhs.push_back("Type");};

IdentifierList:
		T_IDENTIFIER IdentifierLIST {lhs.push_back("IdentifierList");rhs.push_back("T_IDENTIFIER IdentifierLIST");}
		| T_IDENTIFIER {lhs.push_back("IdentifierList");rhs.push_back("T_IDENTIFIER");};
	
IdentifierLIST:	IdentifierLIST T_COMMA T_IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("IdentifierLIST T_COMMA T_IDENTIFIER");}
		| T_COMMA T_IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("T_COMMA T_IDENTIFIER");};

TopLevelDeclList:
     TopLevelDeclList /*here colon*/ TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList TopLevelDecl");}|
	 TopLevelDeclList T_SEMICOLON/*here colon*/ TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList T_SEMICOLON  TopLevelDecl");}
    | TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDecl");};

TopLevelDecl:
	Declaration {lhs.push_back("TopLevelDecl");rhs.push_back("Declaration");}	
	| FunctionDecl {lhs.push_back("TopLevelDecl");rhs.push_back("FunctionDecl");};

Type:
	TypeName {lhs.push_back("Type");rhs.push_back("TypeName");}
	|TypeLit {lhs.push_back("Type");rhs.push_back("TypeLit");};

TypeName:
	T_IDENTIFIER {lhs.push_back("TypeName");rhs.push_back("T_IDENTIFIER");}
	| T_VAR_TYPE {lhs.push_back("TypeName");rhs.push_back("T_VAR_TYPE");};

TypeLit:
	FunctionType {lhs.push_back("TypeLit");rhs.push_back("FunctionType");};

FunctionType:
	T_FUNC Signature {lhs.push_back("FunctionType");rhs.push_back("T_FUNC Signature");};

Operand:
	Literal {lhs.push_back("Operand");rhs.push_back("Literal");}
	| OperandName {lhs.push_back("Operand");rhs.push_back("OperandName");}
	| T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES {lhs.push_back("Operand");rhs.push_back("T_LEFTPARANTHESES Expression T_RIGHTPARANTHESES");};

OperandName:
	T_IDENTIFIER {lhs.push_back("OperandName");rhs.push_back("T_IDENTIFIER");};

ReturnStmt:
	T_RETURN Expression {lhs.push_back("ReturnStmt");rhs.push_back("T_RETURN Expression");}
	| T_RETURN {lhs.push_back("ReturnStmt");rhs.push_back("T_RETURN");};

BreakStmt:
	T_BREAK {lhs.push_back("BreakStmt");rhs.push_back("T_BREAK");};

ContinueStmt:
	T_CONTINUE {lhs.push_back("ContinueStmt");rhs.push_back("T_CONTINUE");};

IfStmt:
	T_IF Expression Block {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block");}//{printf("T_IF case 1");}
	|T_IF Expression Block T_ELSE IfStmt {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block T_ELSE IfStmt");}//{printf("T_IF case 5");}
	|T_IF Expression Block T_ELSE  Block {lhs.push_back("IfStmt");rhs.push_back("T_IF Expression Block T_ELSE  Block");}//{printf("T_IF case 6");}
	|T_IF SimpleStmt T_SEMICOLON Expression Block {lhs.push_back("IfStmt");rhs.push_back("T_IF SimpleStmt T_SEMICOLON Expression Block");}//{printf("T_IF case 2");}
	|T_IF SimpleStmt T_SEMICOLON Expression Block T_ELSE IfStmt  {lhs.push_back("IfStmt");rhs.push_back("T_IF SimpleStmt T_SEMICOLON Expression Block T_ELSE IfStmt");}//{printf("T_IF case 3");}
	|T_IF SimpleStmt T_SEMICOLON Expression Block T_ELSE  Block {lhs.push_back("IfStmt");rhs.push_back("T_IF SimpleStmt T_SEMICOLON Expression Block T_ELSE  Block");}//{printf("T_IF case 4");};

ForStmt:
	T_FOR Condition Block {lhs.push_back("ForStmt");rhs.push_back("T_FOR Condition Block");}
	|T_FOR ForClause Block {lhs.push_back("ForStmt");rhs.push_back("T_FOR ForClause Block");};

Condition:
	Expression {lhs.push_back("Condition");rhs.push_back("Expression");};

ForClause:
	SimpleStmt T_SEMICOLON Condition T_SEMICOLON SimpleStmt {lhs.push_back("ForClause");rhs.push_back("SimpleStmt T_SEMICOLON Condition T_SEMICOLON SimpleStmt");};

ExpressionList:
		ExpressionList T_COMMA Expression {lhs.push_back("ExpressionList");rhs.push_back("ExpressionList T_COMMA Expression");}
		| Expression {lhs.push_back("ExpressionList");rhs.push_back("Expression");};

Literal:
	BasicLit {lhs.push_back("Literal");rhs.push_back("BasicLit");}
	| FunctionLit {lhs.push_back("Literal");rhs.push_back("FunctionLit");};

BasicLit:
	T_INTEGER {lhs.push_back("BasicLit");rhs.push_back("T_INTEGER");}
	| T_FLOAT {lhs.push_back("BasicLit");rhs.push_back("T_FLOAT");}
	| T_STRING {lhs.push_back("BasicLit");rhs.push_back("T_STRING");}
	| T_BYTE {lhs.push_back("BasicLit");rhs.push_back("T_BYTE");};

FunctionLit:
	T_FUNC Function {lhs.push_back("FunctionLit");rhs.push_back("T_FUNC Function");};

PrimaryExpr:
	Operand {lhs.push_back("PrimaryExpr");rhs.push_back("Operand");}|
	PrimaryExpr Selector {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Selector");};

Selector:
	T_PERIOD T_IDENTIFIER {lhs.push_back("Selector");rhs.push_back("T_PERIOD T_IDENTIFIER");};

Expression:
    Expression1 {lhs.push_back("Expression");rhs.push_back("Expression1");};

Expression1:
    Expression1 T_LOR Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression1 T_LOR Expression2");}
    | Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression2");};
Expression2:
    Expression2 T_LAND Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression2 T_LAND Expression3");}
    | Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression3");};

Expression3:
    Expression3 rel_op Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression3 rel_op Expression4");}
    | Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression4");};

Expression4:
    Expression4 add_op Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression4 add_op Expression5");}
    | Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression5");};

Expression5:
    Expression5 mul_op PrimaryExpr {lhs.push_back("Expression5");rhs.push_back("Expression5 mul_op PrimaryExpr");}
    | UnaryExpr {lhs.push_back("Expression5");rhs.push_back("UnaryExpr");};

UnaryExpr:
	PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("PrimaryExpr");}
	| unary_op PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("unary_op PrimaryExpr");};

rel_op:
	T_EQL {lhs.push_back("rel_op");rhs.push_back("T_EQL");}
	| T_NEQ {lhs.push_back("rel_op");rhs.push_back("T_NEQ");}
	| T_LSR {lhs.push_back("rel_op");rhs.push_back("T_LSR");}
	| T_LEQ {lhs.push_back("rel_op");rhs.push_back("T_LEQ");}
	| T_GTR {lhs.push_back("rel_op");rhs.push_back("T_GTR");}
	| T_GEQ {lhs.push_back("rel_op");rhs.push_back("T_GEQ");};

add_op:
	T_ADD {lhs.push_back("add_op");rhs.push_back("T_ADD");}
	| T_MINUS {lhs.push_back("add_op");rhs.push_back("T_SUB");};

mul_op:
	T_MULTIPLY {lhs.push_back("mul_op");rhs.push_back("T_MUL");}
	| T_DIVIDE {lhs.push_back("mul_op");rhs.push_back("T_QUO");}
	| T_MOD {lhs.push_back("mul_op");rhs.push_back("T_REM");}
	| T_AND {lhs.push_back("mul_op");rhs.push_back("T_AND");};

unary_op:
	T_ADD {lhs.push_back("unary_op");rhs.push_back("T_ADD");}
	| T_MINUS {lhs.push_back("unary_op");rhs.push_back("T_SUB");}
	| T_NOT {lhs.push_back("unary_op");rhs.push_back("T_NOT");}
	| T_MULTIPLY {lhs.push_back("unary_op");rhs.push_back("T_MUL");}
	| T_AND {lhs.push_back("unary_op");rhs.push_back("T_AND");};

assign_op:
	  T_ASSIGN {lhs.push_back("assign_op");rhs.push_back("T_ASSIGN");};

PackageClause:
	/*PACKAGE*/T_PACKAGE PackageName {lhs.push_back("PackageClause");rhs.push_back("T_PACKAGE PackageName");};

PackageName:
	T_IDENTIFIER {lhs.push_back("PackageName");rhs.push_back("T_IDENTIFIER");}|
	T_STRING {lhs.push_back("PackageName");rhs.push_back("T_STRING");}	|
	T_STRING T_SEMICOLON {lhs.push_back("PackageName");rhs.push_back("T_STRING T_SEMICOLON");};
	
//Can be list of imports, single import or no imports. Imports from local paths not accounted for.

ImportDeclList:
      ImportDeclList ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDeclList ImportDecl");}//{ printf("got import list 1");}
    | ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDecl");}//{ printf("got import list 2"); }
    | /*empty*/ {lhs.push_back("ImportDeclList");rhs.push_back("/*empty*/");}//{ printf("got import list 3");};

ImportDecl:
	T_IMPORT ImportSpec {lhs.push_back("ImportDecl");rhs.push_back("T_IMPORT ImportSpec T_SEMICOLON");}//{printf("got imports 1");}
	| T_IMPORT T_LEFTPARANTHESES ImportSpecList  T_RIGHTPARANTHESES {lhs.push_back("ImportDecl");rhs.push_back("T_IMPORT T_LEFTPARANTHESES ImportSpecList  T_RIGHTPARANTHESES");}//{printf("got imports 2");};

ImportSpecList:
	ImportSpecList PackageName {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpecList ImportSpec T_SEMICOLON");}
	| ImportSpec {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpec T_SEMICOLON");};

ImportSpec:
 PackageName {lhs.push_back("ImportSpec");rhs.push_back("PackageName2");};

	
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