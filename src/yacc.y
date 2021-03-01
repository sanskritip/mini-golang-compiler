%{
#include<stdio.h>
#include <bits/stdc++.h>
#include "src/symtab.h"
#include "parserIR.tab.h"
using namespace std;

typedef struct{
	char *value;
} node;

int yylex(void);
void yyerror (const char *s) {fprintf (stderr, "%s\n", s);} 
extern FILE *yyin;
extern int yylineno;

vector <string> lhs;
vector <string> rhs;

int lineno=1;

%}



%union {
     char *sval;
     node* nt;
}

%start StartFile 
%token <sval> PACKAGE IMPORT FUNC BREAK CASE CONST CONTINUE DEFAULT
%token <sval> ELSE FOR GO IF RANGE RETURN STRUCT SWITCH TYPE VAR VAR_TYPE
%token <sval> BOOL_CONST NIL_VAL IDENTIFIER BYTE STRING ELLIPSIS
%token <sval> INCREMENT DECREMENT
%token <sval> INTEGER
%token <sval> FLOAT
%left <sval> ADD SUB MUL QUO REM 
%token <sval> ASSIGN AND NOT DEFINE
%left <sval> OR ARROW //Identifier
%right <sval> COLON
%left <sval> LAND LOR EQL NEQ LEQ GEQ SEMICOLON
%left <sval> GTR LSR LEFTPARANTHESES RIGHTPARANTHESES LEFTBRACE RIGHTBRACE LEFTBRACKET RIGHTBRACKET COMMA PERIOD
%type <nt> StartFile Expression Expression1 Expression2 Expression3 Expression4 Expression5 
%type <nt> Block StatementList Statement SimpleStmt int_lit
%type <nt> EmptyStmt /*ExpressionStmt*/ IncDecStmt OPENB CLOSEB 
%type <nt> Assignment Declaration ConstDecl VarSpec string_lit
%type <nt> Signature Result Parameters ParameterList ParameterDecl
%type <nt> ConstSpec MethodDecl Receiver TopLevelDecl TopLevelDeclList LabeledStmt
%type <nt> ReturnStmt BreakStmt ContinueStmt StructType
%type <nt> FunctionDecl FunctionName TypeList
%type <nt> Function FunctionBody FunctionCall ForStmt ForClause /*RangeClause*/ InitStmt ArgumentList Arguments
%type <nt> PostStmt Condition UnaryExpr PrimaryExpr
%type <nt> Selector Index /*Slice */TypeDecl TypeSpecList TypeSpec VarDecl
%type <nt> TypeAssertion ExpressionList ArrayType assign_op rel_op add_op mul_op unary_op Tag byte_lit float_lit Label
//%type <nt> ExprCaseClauseList ExprCaseClause
%type <nt> Operand Literal BasicLit OperandName ImportSpec IfStmt
%type <nt> ImportPath
%type <nt> PackageClause PackageName PackageName2 ImportDecl ImportDeclList ImportSpecList
%type <nt> FieldDeclList FieldDecl Type TypeLit ArrayLength
%type <nt> TypeName
%type <nt> /*QualifiedIdent*/ PointerType IdentifierList IdentifierLIST BaseType

%%
StartFile:
    PackageClause SEMICOLON ImportDeclList TopLevelDeclList {
    	lhs.push_back("StartFile");rhs.push_back("PackageClause SEMICOLON ImportDeclList TopLevelDeclList");
    };

Block:
	LBRACE /*block_mark1*/ OPENB  StatementList CLOSEB /*block_mark2*/ RBRACE{
	lhs.push_back("Block");rhs.push_back("LBRACE OPENB StatementList CLOSEB RBRACE");
    printf("Parsed a Block.\n"); $$=$3;
	};

//block markers start here
/*
block_mark1:{
};
block_mark2:{
};
//block markers end here

OPENB:
	EmptyStmt { lhs.push_back("OPENB");rhs.push_back(" /*empty*/");};
CLOSEB:
	EmptyStmt {lhs.push_back("CLOSEB");rhs.push_back(" /*empty*/ ");};
StatementList:
    StatementList Statement SEMICOLON {
    lhs.push_back("StatementList");rhs.push_back("StatementList Statement SEMICOLON");
    printf("Parsed a List of Statements.\n");
    }|
    Statement SEMICOLON { 
    lhs.push_back("StatementList");rhs.push_back("Statement SEMICOLON");
     printf("Parsed a Statement.\n");
    };
Statement:
	Declaration {lhs.push_back("Statement");rhs.push_back("Declaration");
    printf("Parsed a Declaration.\n");
    }|
	LabeledStmt {lhs.push_back("Statement");rhs.push_back("LabeledStmt");
    printf("Parsed a Labeled Statement.\n");
	}|
	SimpleStmt {lhs.push_back("Statement");rhs.push_back("SimpleStmt");
	printf("Parsed a Simple Statement.\n");
	}|
	ReturnStmt {lhs.push_back("Statement");rhs.push_back("ReturnStmt");
	printf("Parsed a Return Statement.\n");     
	}|
	BreakStmt {lhs.push_back("Statement");rhs.push_back("BreakStmt");
    printf("Parsed a Break Statement.\n");
    }|
	ContinueStmt {lhs.push_back("Statement");rhs.push_back("ContinueStmt");
    printf("Parsed a Continue Statement.\n");
    }|
	Block {lhs.push_back("Statement");rhs.push_back("Block");
	printf("Parsed a Block.\n");     
	}|
	IfStmt {lhs.push_back("Statement");rhs.push_back("IfStmt"); printf("Parsed an IF statement.\n");
	}|
	ForStmt {lhs.push_back("Statement");rhs.push_back("ForStmt");
	 	printf("Parsed a For loop statement.\n");
	} 
	FunctionCall {lhs.push_back("Statement");rhs.push_back("FunctionCall");
	 	printf("Parsed a Function call.\n");
	} 
	FunctionStmt {lhs.push_back("Statement");rhs.push_back("FunctionStmt");
    printf("Parsed a Function statement.\n");
	};
SimpleStmt:
	EmptyStmt {lhs.push_back("SimpleStmt");rhs.push_back("EmptyStmt");}
	IncDecStmt {lhs.push_back("SimpleStmt");rhs.push_back("IncDecStmt");}
	Assignment {lhs.push_back("SimpleStmt");rhs.push_back("Assignment");} 
;
EmptyStmt:
	/*empty*/{
	lhs.push_back("EmptyStmt");rhs.push_back("/*empty*/");
	}
	;
LabeledStmt:
	Label COLON Statement {lhs.push_back("LabeledStmt");rhs.push_back("Label COLON Statement");};
Label:
	IDENTIFIER {
	lhs.push_back("Label");rhs.push_back("IDENTIFIER");};
IncDecStmt:
	Expression INC {
	lhs.push_back("IncDecStmt");rhs.push_back("Expression INC");
	lineno++;
	}
	Expression DEC {
	lineno++;
	lhs.push_back("IncDecStmt");rhs.push_back("Expression DEC");
	};
Assignment:
	ExpressionList assign_op ExpressionList {
		lhs.push_back("Assignment");rhs.push_back("ExpressionList assign_op ExpressionList");
	};
VarDecl:
		VAR VarSpec {lhs.push_back("VarDecl");rhs.push_back("VAR VarSpec");
		};
VarSpec:
		IdentifierList Type ASSIGN ExpressionList {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type ASSIGN ExpressionList");}|
		IdentifierList Type {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type");
		};

Declaration:
	ConstDecl {lhs.push_back("Declaration");rhs.push_back("ConstDecl");
		//unimplemented
	}
	| TypeDecl {lhs.push_back("Declaration");rhs.push_back("TypeDecl");
		//unimplemented for now - OOPS - to do afterwards
	}
	| VarDecl {lhs.push_back("Declaration");rhs.push_back("VarDecl");};
FunctionDecl:
		FUNC FunctionName OPENB Function CLOSEB {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Function CLOSEB");
	
		}
		FUNC FunctionName OPENB Signature CLOSEB {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Signature CLOSEB");
		};
FunctionName:
		IDENTIFIER {
		    	lhs.push_back("FunctionName");rhs.push_back("IDENTIFIER");
		};
Function:
		Signature FunctionBody {lhs.push_back("Function");rhs.push_back("Signature FunctionBody")
		};
FunctionBody:		
		Block {lhs.push_back("FunctionBody");rhs.push_back("Block");
		};
FunctionStmt:
		VarDecl DEFINE FunctionCall{lhs.push_back("FunctionStmt");rhs.push_back("VarDecl DEFINE FunctionCall");
		lineno++;
		}|
		IDENTIFIER DEFINE FunctionCall{lhs.push_back("FunctionStmt");rhs.push_back("IDENTIFIER DEFINE FunctionCall");
	    lineno++;
		};
FunctionCall:	PrimaryExpr LPAREN ArgumentList RPAREN {lhs.push_back("FunctionCall");rhs.push_back("PrimaryExpr LPAREN ArgumentList RPAREN");
};		
ArgumentList:	
		ArgumentList COMMA Arguments {lhs.push_back("ArgumentList");rhs.push_back("ArgumentList COMMA Arguments");	
		}|
		/*empty*/{lhs.push_back("ArgumentList");rhs.push_back("/*empty*/");
		}|
		Arguments {lhs.push_back("ArgumentList");rhs.push_back("Arguments");
		
		};
Arguments:	
        PrimaryExpr {lhs.push_back("Arguments");rhs.push_back("PrimaryExpr");}|
		FunctionCall {lhs.push_back("Arguments");rhs.push_back("FunctionCall");};
		
//function call till here 
Signature:
	Parameters {lhs.push_back("Signature");rhs.push_back("Parameters");
		
	}|
	Parameters Result {lhs.push_back("Signature");rhs.push_back("Parameters Result");
	};
Result:
	LPAREN TypeList RPAREN {lhs.push_back("Result");rhs.push_back("LPAREN TypeList RPAREN");
		//unimplemented
		//one return to return them all
	}|
	Type  {lhs.push_back("Result");rhs.push_back("Type");
		//set symbol table 
			
	};
Parameters:
	LPAREN RPAREN { 
	lhs.push_back("Parameters");rhs.push_back("LPAREN RPAREN");
        printf("Parsed a function without any Arguements.\n")
	}
	LPAREN ParameterList RPAREN {lhs.push_back("Parameters");rhs.push_back("LPAREN ParameterList RPAREN");		
	}; 
ParameterList:
	ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterDecl");
		
	}
	|ParameterList COMMA ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterList COMMA ParameterDecl");
	};
ParameterDecl:
	IdentifierList Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList Type");
		//symbol table
		}
	IdentifierList ELLIPSIS  Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList ELLIPSIS  Type");
		//unimplemented
	}
	|ELLIPSIS Type {lhs.push_back("ParameterDecl");rhs.push_back("ELLIPSIS Type");
		//unimplemented
	};
TypeList:
    TypeList COMMA Type {lhs.push_back("TypeList");rhs.push_back("TypeList COMMA Type");
    		//TODO
    }|
    Type {lhs.push_back("TypeList");rhs.push_back("Type");
    		
    };
IdentifierList:
		IDENTIFIER IdentifierLIST {lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER IdentifierLIST");
		}|
		IDENTIFIER {
			lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER");};
IdentifierLIST:	
        IdentifierLIST COMMA IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("IdentifierLIST COMMA IDENTIFIER");
		}|
		COMMA IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("COMMA IDENTIFIER");
		};
MethodDecl:
	FUNC Receiver IDENTIFIER Function {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Function");}|
	FUNC Receiver IDENTIFIER Signature {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Signature");}
	;
Receiver:
	Parameters {lhs.push_back("Receiver");rhs.push_back("Parameters");};
TopLevelDeclList:
    TopLevelDeclList SEMICOLON TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList SEMICOLON  TopLevelDecl");}|
    TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDecl");
      }
    ;
TopLevelDecl:
	Declaration {lhs.push_back("TopLevelDecl");rhs.push_back("Declaration");
		//normal declaration for global variables
		
	}|	
	FunctionDecl {lhs.push_back("TopLevelDecl");rhs.push_back("FunctionDecl");
	  	
	  }|
	MethodDecl {lhs.push_back("TopLevelDecl");rhs.push_back("MethodDecl");
		//unimplemented for now
	}
	;
TypeLit:
	ArrayType {lhs.push_back("TypeLit");rhs.push_back("ArrayType");
		
	}|
	| StructType {lhs.push_back("TypeLit");rhs.push_back("StructType");
		//unimplemented for now TODO
	}|
	PointerType {lhs.push_back("TypeLit");rhs.push_back("PointerType");}|
	FunctionType {lhs.push_back("TypeLit");rhs.push_back("FunctionType");}
	;
Type:
	TypeName {lhs.push_back("Type");rhs.push_back("TypeName");}|
	TypeLit {lhs.push_back("Type");rhs.push_back("TypeLit");}
	;
Operand:
	Literal {
	lhs.push_back("Operand");rhs.push_back("Literal");
	//cout << "here\n";
	
	}|
	OperandName {
	lhs.push_back("Operand");rhs.push_back("OperandName");
	
	}|
	LPAREN Expression RPAREN {
	lhs.push_back("Operand");rhs.push_back("LPAREN Expression RPAREN");
	};

OperandName:
	IDENTIFIER {
	lhs.push_back("OperandName");rhs.push_back("IDENTIFIER");
	};

ReturnStmt:
	RETURN Expression {lhs.push_back("ReturnStmt");rhs.push_back("RETURN Expression")
	}|
	RETURN {lhs.push_back("ReturnStmt");rhs.push_back("RETURN");
	};

BreakStmt:
	BREAK Label {lhs.push_back("BreakStmt");rhs.push_back("BREAK Label");
		//unimplemented
	}|
	BREAK {lhs.push_back("BreakStmt");rhs.push_back("BREAK");
	};

ContinueStmt:
	CONTINUE Label {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE Label");
		//unimplemented
	}|
	CONTINUE {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE");
	};

IfStmt:
	IF OPENB Expression if_mark1 Block if_mark2 CLOSEB{
	lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block CLOSEB");
	}
	|IF OPENB SimpleStmt SEMICOLON Expression if_mark1 Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block CLOSEB"); printf("IF case 2");}
	|IF OPENB SimpleStmt SEMICOLON Expression if_mark1 Block if_markend1 ELSE IfStmt CLOSEB  {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE IfStmt CLOSEB"); printf("IF case 3");}
	|IF OPENB SimpleStmt SEMICOLON Expression if_mark1 Block if_markend1 ELSE  Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE  Block CLOSEB"); printf("IF case 4");}
	|IF OPENB Expression if_mark1 Block if_markend1 ELSE if_mark22 IfStmt if_markend2 CLOSEB if_markend {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE IfStmt CLOSEB"); printf("IF case 5");}
	|IF OPENB Expression if_mark1 Block if_markend1 ELSE if_mark22 Block if_markend2 CLOSEB if_markend {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE  Block CLOSEB"); printf("IF case 6");}
	;
ForStmt:
	FOR OPENB for_initmark Condition for_mark1 Block for_mark2 CLOSEB for_markend1 {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB Condition Block CLOSEB");}
	|FOR OPENB for_initmark ForClause Block for_mark22 CLOSEB for_markend1 {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB ForClause Block CLOSEB");}
	;
Condition:
	Expression {lhs.push_back("Condition");rhs.push_back("Expression");};

ForClause:
	InitStmt for_clause_mark1 SEMICOLON Condition for_clause_mark2 SEMICOLON PostStmt for_clause_mark3 {lhs.push_back("ForClause");rhs.push_back("InitStmt SEMICOLON Condition SEMICOLON PostStmt");}
	;
InitStmt:
	SimpleStmt {lhs.push_back("InitStmt");rhs.push_back("SimpleStmt");};
PostStmt:
	SimpleStmt {lhs.push_back("PostStmt");rhs.push_back("SimpleStmt");
	};

//for markers start here
//for - 2
for_clause_mark1:{
	};
for_clause_mark2: {	
	};		
for_clause_mark3:
		{
	};
for_mark22: {
	};			
//for - 1 
for_initmark:{
	};
for_mark1: {	
	};

for_mark2: {
	};

for_markend1: {
	};	

//for markers end here

int_lit:
	INTEGER{
        printf("Parsed a Integer Lietral\n");
	lhs.push_back("int_lit");rhs.push_back("INTEGER");
	};
float_lit:
	  FLOAT{
          printf("Parsed a Float Lietral\n");
	
	  lhs.push_back("float_lit");rhs.push_back("FLOAT");};
TypeName:
	IDENTIFIER {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("TypeName");rhs.push_back("IDENTIFIER");
	}
	| VAR_TYPE {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("TypeName");rhs.push_back("VAR_TYPE");
	}
	;

/*

ArrayType:
	LBRACK ArrayLength RBRACK Type{lhs.push_back("ArrayType");rhs.push_back("LBRACK ArrayLength RBRACK Type");
	}
	;

ArrayLength:
	Expression{lhs.push_back("ArrayLength");rhs.push_back("Expression");	
	};
StructType:
    STRUCT LBRACE FieldDeclList RBRACE {lhs.push_back("StructType");rhs.push_back("STRUCT LBRACE FieldDeclList RBRACE");}
    | STRUCT LBRACE RBRACE {lhs.push_back("StructType");rhs.push_back("STRUCT LBRACE RBRACE");}
    ;
FieldDeclList:
    FieldDecl SEMICOLON {lhs.push_back("FieldDeclList");rhs.push_back("FieldDecl SEMICOLON");}
    | FieldDeclList FieldDecl SEMICOLON {lhs.push_back("FieldDeclList");rhs.push_back("FieldDeclList FieldDecl SEMICOLON");}
    ;

FieldDecl:
	IdentifierList Type {lhs.push_back("FieldDecl");rhs.push_back("IdentifierList Type");}
	| IdentifierList Type Tag {lhs.push_back("FieldDecl");rhs.push_back("IdentifierList Type Tag");}
	;

Tag:
	STRING {
	lhs.push_back("Tag");rhs.push_back("STRING");}
	;

PointerType:
	MUL BaseType {lhs.push_back("PointerType");rhs.push_back("MUL BaseType");
		//TODO
		//symbol table
	}
	;
BaseType:
	Type {lhs.push_back("BaseType");rhs.push_back("Type");}
	;

FunctionType:
	FUNC Signature {lhs.push_back("FunctionType");rhs.push_back("FUNC Signature");
		//unimplemented
	}
	;

ConstDecl:
		CONST ConstSpec {lhs.push_back("ConstDecl");rhs.push_back("CONST ConstSpec");
			///symbol table - put is_constant = 1 in symtab
		}
		;

ConstSpec:
		IDENTIFIER Type ASSIGN Expression {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type ASSIGN Expression");
		}
		IDENTIFIER Type {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type");
		}
		;

ExpressionList:
		ExpressionList COMMA Expression {
		lhs.push_back("ExpressionList");rhs.push_back("ExpressionList COMMA Expression");
		}
		| Expression {
		lhs.push_back("ExpressionList");rhs.push_back("Expression");
		
		}
		;

TypeDecl:
		TYPE  TypeSpec {lhs.push_back("TypeDecl");rhs.push_back("TYPE  TypeSpec");}
		| TYPE LPAREN TypeSpecList RPAREN {lhs.push_back("TypeDecl");rhs.push_back("TYPE LPAREN TypeSpecList RPAREN");};

TypeSpecList:
		TypeSpecList TypeSpec SEMICOLON {lhs.push_back("TypeSpecList");rhs.push_back("TypeSpecList TypeSpec SEMICOLON");}
		| TypeSpec SEMICOLON {lhs.push_back("TypeSpecList");rhs.push_back("TypeSpec SEMICOLON");}
		;
TypeSpec:
		AliasDecl {lhs.push_back("TypeSpec");rhs.push_back("AliasDecl");}
		| TypeDef {lhs.push_back("TypeSpec");rhs.push_back("TypeDef");};

AliasDecl:
		IDENTIFIER ASSIGN Type {lhs.push_back("AliasDecl");rhs.push_back("IDENTIFIER ASSIGN Type");}
		;

TypeDef:
		IDENTIFIER Type {lhs.push_back("TypeDef");rhs.push_back("IDENTIFIER Type");}
		;

Literal:
	BasicLit {
	lhs.push_back("Literal");rhs.push_back("BasicLit");
	
	}
	| FunctionLit {lhs.push_back("Literal");rhs.push_back("FunctionLit");} //unimplemented
	;

string_lit:
	STRING {
	lhs.push_back("string_lit");rhs.push_back("STRING");
	}
	;
byte_lit:
	BYTE {
	lhs.push_back("byte_lit");rhs.push_back("BYTE");}
	;
	
BasicLit:
	int_lit {
	lhs.push_back("BasicLit");rhs.push_back("int_lit");
	
	//cout << "at basic lit" << endl;
	//cout << $1->value << endl;
	//cout << $$->value << endl;
	//printf("%s\n",(char*)$1);
	}
	| float_lit {lhs.push_back("BasicLit");rhs.push_back("float_lit");}
	| string_lit {lhs.push_back("BasicLit");rhs.push_back("string_lit");
	}
	| byte_lit {lhs.push_back("BasicLit");rhs.push_back("byte_lit");}	//added later
	;


FunctionLit:
	FUNC Function {lhs.push_back("FunctionLit");rhs.push_back("FUNC Function");};

PrimaryExpr:
	Operand {
	lhs.push_back("PrimaryExpr");rhs.push_back("Operand");
	
	}|
	PrimaryExpr Selector {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Selector");
	}|
	PrimaryExpr Index {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Index");

	}|
	PrimaryExpr TypeAssertion {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr TypeAssertion");
		//unimplemented
	}|
	OperandName StructLiteral {lhs.push_back("PrimaryExpr");rhs.push_back("OperandName StructLiteral");
		//unimplemented for now
	}
	;

StructLiteral:
    LBRACE KeyValList RBRACE {lhs.push_back("StructLiteral");rhs.push_back("LBRACE KeyValList RBRACE");}
    ;

KeyValList:
	Expression COLON Expression {lhs.push_back("KeyValList");rhs.push_back("Expression COLON Expression");}| 
	KeyValList COMMA Expression COLON Expression  {lhs.push_back("KeyValList");rhs.push_back("KeyValList COMMA Expression COLON Expression");};

Selector:
	PERIOD IDENTIFIER {lhs.push_back("Selector");rhs.push_back("PERIOD IDENTIFIER");

	};
Index:	
	LBRACK Expression RBRACK {lhs.push_back("Index");rhs.push_back("LBRACK Expression RBRACK");

	};
TypeAssertion:
	PERIOD LPAREN Type RPAREN {lhs.push_back("TypeAssertion");rhs.push_back("PERIOD LPAREN Type RPAREN");
		//unimplemented
	};
Expression:
    Expression1 {
    lhs.push_back("Expression");rhs.push_back("Expression1");    
    }
    ;
Expression1:
    Expression1 LOR Expression2 {	//typecheck LOR
    lhs.push_back("Expression1");rhs.push_back("Expression1 LOR Expression2");

    }
    |Expression2 {
    lhs.push_back("Expression1");rhs.push_back("Expression2");
    }
    ;

Expression2:
    Expression2 LAND Expression3 {	//typecheck LAND
    lhs.push_back("Expression2");rhs.push_back("Expression2 LAND Expression3");}
    | Expression3 {
    lhs.push_back("Expression2");rhs.push_back("Expression3");
    };
Expression3:
    Expression3 rel_op Expression4 {
    lhs.push_back("Expression3");rhs.push_back("Expression3 rel_op Expression4");
    }
    | Expression4 {
    lhs.push_back("Expression3");rhs.push_back("Expression4"); 
    };

Expression4:
    Expression4 add_op Expression5 {
    lhs.push_back("Expression4");rhs.push_back("Expression4 add_op Expression5");
    }
    |Expression5 {
    lhs.push_back("Expression4");rhs.push_back("Expression5");
    };

Expression5:
    Expression5 mul_op PrimaryExpr {
    lhs.push_back("Expression5");rhs.push_back("Expression5 mul_op PrimaryExpr");
    }
    UnaryExpr {
    lhs.push_back("Expression5");rhs.push_back("UnaryExpr");
    }
    ;
UnaryExpr:
	PrimaryExpr {
	lhs.push_back("UnaryExpr");rhs.push_back("PrimaryExpr");
	}
	| unary_op PrimaryExpr {
	lhs.push_back("UnaryExpr");rhs.push_back("unary_op PrimaryExpr");
	}
	//UnaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("UnaryExpr");}
	;

binary_op:
	LOR {
	lhs.push_back("binary_op");rhs.push_back("LOR");}
	| LAND {
	lhs.push_back("binary_op");rhs.push_back("LAND");}
	| rel_op {lhs.push_back("binary_op");rhs.push_back("rel_op");}
	| add_op {lhs.push_back("binary_op");rhs.push_back("add_op");}
	| mul_op {lhs.push_back("binary_op");rhs.push_back("mul_op");};
rel_op:
	EQL {
	lhs.push_back("rel_op");rhs.push_back("EQL");}
	| NEQ {
	lhs.push_back("rel_op");rhs.push_back("NEQ");}
	| LSS {
	lhs.push_back("rel_op");rhs.push_back("LSS");}
	| LEQ {
	lhs.push_back("rel_op");rhs.push_back("LEQ");}
	| GTR {
	lhs.push_back("rel_op");rhs.push_back("GTR");}
	| GEQ {
	lhs.push_back("rel_op");rhs.push_back("GEQ");};
add_op:
	ADD {
	lhs.push_back("add_op");rhs.push_back("ADD");}
	| SUB {
	lhs.push_back("add_op");rhs.push_back("SUB");}
	| OR {
	lhs.push_back("add_op");rhs.push_back("OR");}
	| XOR {
	lhs.push_back("add_op");rhs.push_back("XOR");};
mul_op:
	MUL {
	lhs.push_back("mul_op");rhs.push_back("MUL");}
	| QUO {
	lhs.push_back("mul_op");rhs.push_back("QUO");}
	| REM {
	lhs.push_back("mul_op");rhs.push_back("REM");}
	| SHL {
	lhs.push_back("mul_op");rhs.push_back("SHL");}
	| SHR {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("mul_op");rhs.push_back("SHR");}
	| AND {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("mul_op");rhs.push_back("AND");}
	| AND_NOT {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("mul_op");rhs.push_back("AND_NOT");};

unary_op:
	ADD {
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("ADD");}
	| SUB {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("SUB");}
	| NOT {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("NOT");}
	| XOR {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("XOR");}
	| MUL {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("MUL");}
	| AND {
	
	//cout << "here integer\n";
	//cout << (*$$).value << end
	lhs.push_back("unary_op");rhs.push_back("AND");}
	;


assign_op:
	  ASSIGN {
	  lhs.push_back("assign_op");rhs.push_back("ASSIGN");
	  
	  $1 = (*$$).value;
	  }
	| ADD_ASSIGN {
	lhs.push_back("assign_op");rhs.push_back("ADD_ASSIGN");
	}
	| SUB_ASSIGN {
	lhs.push_back("assign_op");rhs.push_back("SUB_ASSIGN");
	}
	| MUL_ASSIGN {
	lhs.push_back("assign_op");rhs.push_back("MUL_ASSIGN");
	}
	| QUO_ASSIGN {lhs.push_back("assign_op");rhs.push_back("QUO_ASSIGN");
	}
	| REM_ASSIGN {lhs.push_back("assign_op");rhs.push_back("REM_ASSIGN");
	
	  }
	;
/*IfStmt shift/reduce conflict*/

PackageClause:
	/*PACKAGE*/PACKAGE PackageName {lhs.push_back("PackageClause");rhs.push_back("PACKAGE PackageName");
	printf("Parsed a Package Clause")
	};
PackageName:
	IDENTIFIER {lhs.push_back("PackageName");rhs.push_back("IDENTIFIER");};
	
ImportDeclList:
    //* empty */ {  }    |
      ImportDeclList ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDeclList ImportDecl");printf("got import list 1");}
    | ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDecl");      printf("got import list 2"); }
    | /*empty*/ {lhs.push_back("ImportDeclList");rhs.push_back("/*empty*/"); printf("got import list 3");};

ImportDecl:
	IMPORT ImportSpec SEMICOLON {lhs.push_back("ImportDecl");rhs.push_back("IMPORT ImportSpec SEMICOLON");printf("got imports 1");}
	|IMPORT LPAREN ImportSpecList  RPAREN {lhs.push_back("ImportDecl");rhs.push_back("IMPORT LPAREN ImportSpecList  RPAREN");printf("got imports 2");}
	;

ImportSpecList:
	ImportSpecList ImportSpec SEMICOLON {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpecList ImportSpec SEMICOLON");}
	| ImportSpec SEMICOLON {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpec SEMICOLON");}
	;
ImportSpec:
	 PERIOD ImportPath {lhs.push_back("ImportSpec");rhs.push_back("PERIOD ImportPath");}
	| PackageName2 ImportPath {lhs.push_back("ImportSpec");rhs.push_back("PackageName2 ImportPath");}
	| PackageName2 {lhs.push_back("ImportSpec");rhs.push_back("PackageName2");
	  
	  };
ImportPath:
	string_lit {lhs.push_back("ImportPath");rhs.push_back("string_lit");
	
	}
	;
PackageName2:
	string_lit {lhs.push_back("PackageName2");rhs.push_back("string_lit");
	printf("-----package2----");}	
	;
%%

main()
{
    FILE *fp = fopen("test/test1.go", "r");
	if(fp)
			yyin = fp;
     do
       {
           yyparse();
     }
        while (!feof(yyin));
}
yyerror(s)
char *s;
{
    fprintf(stderr, "%s\n", s);
}