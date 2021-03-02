%{
#include <bits/stdc++.h>
#include "y.tab.h"
using namespace std;
#include "src/SymbolTable.h"
int yylex();
void yyerror (const char *s) {fprintf (stderr, "%s\n", s);} 

//string typeName="";
extern FILE *yyin;
extern int yylineno;

vector <string> lhs;
vector <string> rhs;

%}

//%error-verbose
%define parse.error verbose

%union {
     char *nt;
     char *sval;
}

%token <sval> PACKAGE IMPORT FUNC BREAK CASE CONST CONTINUE DEFAULT
%token <sval> ELSE FOR GO IF RANGE RETURN STRUCT SWITCH TYPE VAR VAR_TYPE
%token <sval> BOOL_CONST NIL_VAL IDENTIFIER BYTE STRING ELLIPSIS
%token <sval> SHL SHR INCREMENT DECREMENT 
%token <sval> INTEGER
%token <sval> FLOAT
%left <sval> ADD MINUS MULTIPLY DIVIDE MOD
%right <sval> ASSIGN AND NOT DEFINE AND_NOT
%left <sval> OR XOR ARROW //Identifier
%right <sval> COLON
%left <sval> LAND LOR EQL NEQ LEQ GEQ SEMICOLON
%left <sval> GTR LSR LEFTPARANTHESES RIGHTPARANTHESES LEFTBRACE RIGHTBRACE LEFTBRACKET RIGHTBRACKET COMMA PERIOD


%type <nt> StartFile Expression 
%type <nt> Block StatementList Statement SimpleStmt 
%type <nt> EmptyStmt /*ExpressionStmt*/ IncDecStmt 
%type <nt> Assignment Declaration ConstDecl VarSpec
%type <nt> Signature Result Parameters ParameterList ParameterDecl
%type <nt> ConstSpec MethodDecl Receiver TopLevelDecl TopLevelDeclList LabeledStmt
%type <nt> ReturnStmt BreakStmt ContinueStmt StructType
%type <nt> FunctionDecl FunctionName TypeList
%type <nt> Function FunctionBody FunctionCall ForStmt ForClause /*RangeClause*/ InitStmt ArgumentList
%type <nt> PostStmt Condition UnaryExpr PrimaryExpr
%type <nt> Selector Index /*Slice */TypeDecl TypeSpecList TypeSpec VarDecl
%type <nt> TypeAssertion ExpressionList ArrayType 
%type <nt> Operand Literal BasicLit OperandName ImportSpec IfStmt
%type <nt> ImportPath/* SliceType*/
%type <nt> PackageClause PackageName PackageName2 ImportDecl ImportDeclList ImportSpecList
%type <nt> FieldDeclList FieldDecl Type
%type <nt> TypeName
%type <nt> /*QualifiedIdent*/ PointerType IdentifierList

%% 


StartFile:
    PackageClause ImportDeclList TopLevelDeclList {
		printf("Parsed Start of program file.");
    	lhs.push_back("StartFile");rhs.push_back("PackageClause ImportDeclList TopLevelDeclList");//cout << "---" << $$ << "---" << $3 << "---";
    }
    ;

Block:
	LEFTBRACE OPENB StatementList CLOSEB RIGHTBRACE{lhs.push_back("Block");rhs.push_back("LEFTBRACE OPENB StatementList CLOSEB RIGHTBRACE");}
	//printf("I have a block -------");cout << $1 << endl;}
	; 


OPENB:
	/*empty*/{lhs.push_back("OPENB");rhs.push_back("/*empty*/");}
	;
	
CLOSEB:
	/*empty*/{lhs.push_back("CLOSEB");rhs.push_back("/*empty*/");}
	;

StatementList:
    StatementList Statement SEMICOLON {lhs.push_back("StatementList");rhs.push_back("StatementList Statement SEMICOLON");}
    | Statement SEMICOLON {lhs.push_back("StatementList");rhs.push_back("Statement SEMICOLON");}
	| StatementList Statement {lhs.push_back("StatementList");rhs.push_back("StatementList Statement ");}
    | Statement{lhs.push_back("StatementList");rhs.push_back("Statement ");}
    ;

Statement:
	Declaration {lhs.push_back("Statement");rhs.push_back("Declaration");}
	| LabeledStmt {lhs.push_back("Statement");rhs.push_back("LabeledStmt");}
	| SimpleStmt {lhs.push_back("Statement");rhs.push_back("SimpleStmt");}
	|ReturnStmt {lhs.push_back("Statement");rhs.push_back("ReturnStmt");}
	| BreakStmt {lhs.push_back("Statement");rhs.push_back("BreakStmt");}
	| ContinueStmt {lhs.push_back("Statement");rhs.push_back("ContinueStmt");}
	|Block {lhs.push_back("Statement");rhs.push_back("Block");}
	| IfStmt {lhs.push_back("Statement");rhs.push_back("IfStmt");}
	|  ForStmt {lhs.push_back("Statement");rhs.push_back("ForStmt");} 
	| FunctionCall {lhs.push_back("Statement");rhs.push_back("FunctionCall");} 
	| FunctionStmt {lhs.push_back("Statement");rhs.push_back("FunctionStmt");};

SimpleStmt:
	EmptyStmt {lhs.push_back("SimpleStmt");rhs.push_back("EmptyStmt");}
	|  IncDecStmt {lhs.push_back("SimpleStmt");rhs.push_back("IncDecStmt");}
	| Assignment {lhs.push_back("SimpleStmt");rhs.push_back("Assignment");} 
;

EmptyStmt:
	/*empty*/{lhs.push_back("EmptyStmt");rhs.push_back("/*empty*/");}
	;



LabeledStmt:
	Label COLON Statement {lhs.push_back("LabeledStmt");rhs.push_back("Label COLON Statement");};
Label:
	IDENTIFIER {lhs.push_back("Label");rhs.push_back("IDENTIFIER");};



IncDecStmt:
	Expression INCREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression INC");}
	|Expression DECREMENT {lhs.push_back("IncDecStmt");rhs.push_back("Expression DEC");};

Assignment:
	ExpressionList assign_op ExpressionList {lhs.push_back("Assignment");rhs.push_back("ExpressionList assign_op ExpressionList");}
	;

VarDecl:
		VAR VarSpec {lhs.push_back("VarDecl");rhs.push_back("VAR VarSpec");}
		;
VarSpec:
		IdentifierList Type ASSIGN ExpressionList {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type ASSIGN ExpressionList");}
		| IdentifierList Type {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type");}
		;


Declaration:
	ConstDecl {lhs.push_back("Declaration");rhs.push_back("ConstDecl");}
	| TypeDecl {lhs.push_back("Declaration");rhs.push_back("TypeDecl");}
	| VarDecl {lhs.push_back("Declaration");rhs.push_back("VarDecl");};


FunctionDecl:
		FUNC FunctionName OPENB Function CLOSEB {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Function CLOSEB");}
		|FUNC FunctionName OPENB Signature CLOSEB {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Signature CLOSEB");};
FunctionName:
		IDENTIFIER {lhs.push_back("FunctionName");rhs.push_back("IDENTIFIER");};
Function:
		Signature FunctionBody {lhs.push_back("Function");rhs.push_back("Signature FunctionBody");};
FunctionBody:		
		Block {lhs.push_back("FunctionBody");rhs.push_back("Block");};
//function call starts here
FunctionStmt:
		VarDecl DEFINE FunctionCall{lhs.push_back("FunctionStmt");rhs.push_back("VarDecl DEFINE FunctionCall");}
		| IDENTIFIER DEFINE FunctionCall{lhs.push_back("FunctionStmt");rhs.push_back("IDENTIFIER DEFINE FunctionCall");}
		;


FunctionCall:	PrimaryExpr LEFTPARANTHESES ArgumentList RIGHTPARANTHESES {lhs.push_back("FunctionCall");rhs.push_back("PrimaryExpr LEFTPARANTHESES ArgumentList RIGHTPARANTHESES");}
		;		

ArgumentList:	
		ArgumentList COMMA Arguments {lhs.push_back("ArgumentList");rhs.push_back("ArgumentList COMMA Arguments");}//{printf("function's arguments---1");}
		| Arguments {lhs.push_back("ArgumentList");rhs.push_back("Arguments");}//{printf("function's arguments ---2");}
		| /*empty*/{lhs.push_back("ArgumentList");rhs.push_back("/*empty*/");}
		;

Arguments:	PrimaryExpr {lhs.push_back("Arguments");rhs.push_back("PrimaryExpr");}//{printf("------------");}
		| FunctionCall {lhs.push_back("Arguments");rhs.push_back("FunctionCall");}
		;
		
//function call till here 

Signature:
	Parameters {lhs.push_back("Signature");rhs.push_back("Parameters");}
	|Parameters Result {lhs.push_back("Signature");rhs.push_back("Parameters Result");};

//------------------------------------------------------------------------------------------------------end
Result:
	LEFTPARANTHESES TypeList RIGHTPARANTHESES {lhs.push_back("Result");rhs.push_back("LEFTPARANTHESES TypeList RIGHTPARANTHESES");}
	| Type  {lhs.push_back("Result");rhs.push_back("Type");};

Parameters:
	LEFTPARANTHESES RIGHTPARANTHESES { lhs.push_back("Parameters");rhs.push_back("LEFTPARANTHESES RIGHTPARANTHESES");}//printf("gor func with no arguments");}
	| LEFTPARANTHESES ParameterList RIGHTPARANTHESES {lhs.push_back("Parameters");rhs.push_back("LEFTPARANTHESES ParameterList RIGHTPARANTHESES");}
	|LEFTPARANTHESES ParameterList COMMA RIGHTPARANTHESES {lhs.push_back("Parameters");rhs.push_back("LEFTPARANTHESES ParameterList COMMA RIGHTPARANTHESES");}
	; 
ParameterList:
	ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterDecl");}
	|ParameterList COMMA ParameterDecl {lhs.push_back("ParameterList");rhs.push_back("ParameterList COMMA ParameterDecl");}
	;

//change

ParameterDecl:
	IdentifierList Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList Type");}
	| IdentifierList ELLIPSIS  Type {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList ELLIPSIS  Type");}
	|ELLIPSIS Type {lhs.push_back("ParameterDecl");rhs.push_back("ELLIPSIS Type");}
	;

TypeList:
    TypeList COMMA Type {lhs.push_back("TypeList");rhs.push_back("TypeList COMMA Type");}
    | Type {lhs.push_back("TypeList");rhs.push_back("Type");}
    ;

//--------------------------------------------------------------------------------------------------------------------------------start
IdentifierList:
		IDENTIFIER IdentifierLIST {lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER IdentifierLIST");}
		| IDENTIFIER {lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER");}
		;
//-----------------------------------------------end		
IdentifierLIST:	IdentifierLIST COMMA IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("IdentifierLIST COMMA IDENTIFIER");}
		| COMMA IDENTIFIER {lhs.push_back("IdentifierLIST");rhs.push_back("COMMA IDENTIFIER");}
		;

MethodDecl:
	FUNC Receiver IDENTIFIER Function {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Function");}
	| FUNC Receiver IDENTIFIER Signature {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Signature");}
	;

Receiver:
	Parameters {lhs.push_back("Receiver");rhs.push_back("Parameters");};

TopLevelDeclList:
    TopLevelDeclList SEMICOLON /*here colon*/ TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList SEMICOLON  TopLevelDecl");}
    | TopLevelDecl  {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDecl");}
    ;

TopLevelDecl:
	Declaration {lhs.push_back("TopLevelDecl");rhs.push_back("Declaration");}	
	| FunctionDecl {lhs.push_back("TopLevelDecl");rhs.push_back("FunctionDecl");}
	| MethodDecl {lhs.push_back("TopLevelDecl");rhs.push_back("MethodDecl");}
	;

TypeLit:
	ArrayType {lhs.push_back("TypeLit");rhs.push_back("ArrayType");}
	| StructType {lhs.push_back("TypeLit");rhs.push_back("StructType");}
	| PointerType {lhs.push_back("TypeLit");rhs.push_back("PointerType");}
	| FunctionType {lhs.push_back("TypeLit");rhs.push_back("FunctionType");}
	;



Type:
	TypeName {lhs.push_back("Type");rhs.push_back("TypeName");}
	| TypeLit {lhs.push_back("Type");rhs.push_back("TypeLit");}
	;

Operand:
	Literal {lhs.push_back("Operand");rhs.push_back("Literal");}
	| OperandName {lhs.push_back("Operand");rhs.push_back("OperandName");}
	| LEFTPARANTHESES Expression RIGHTPARANTHESES {lhs.push_back("Operand");rhs.push_back("LEFTPARANTHESES Expression RIGHTPARANTHESES");};

OperandName:
	IDENTIFIER {lhs.push_back("OperandName");rhs.push_back("IDENTIFIER");}
;

ReturnStmt:
	RETURN Expression {lhs.push_back("ReturnStmt");rhs.push_back("RETURN Expression");}
	|RETURN {lhs.push_back("ReturnStmt");rhs.push_back("RETURN");};

BreakStmt:
	BREAK Label {lhs.push_back("BreakStmt");rhs.push_back("BREAK Label");}
	| BREAK {lhs.push_back("BreakStmt");rhs.push_back("BREAK");};

ContinueStmt:
	CONTINUE Label {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE Label");}
	|CONTINUE {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE");}
	;

IfStmt:
	IF OPENB Expression Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block CLOSEB");}//{printf("IF case 1");}
	|IF OPENB SimpleStmt SEMICOLON Expression Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block CLOSEB");}//{printf("IF case 2");}
	|IF OPENB SimpleStmt SEMICOLON Expression Block ELSE IfStmt CLOSEB  {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE IfStmt CLOSEB");}//{printf("IF case 3");}
	|IF OPENB SimpleStmt SEMICOLON Expression Block ELSE  Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE  Block CLOSEB");}//{printf("IF case 4");}
	|IF OPENB Expression Block ELSE IfStmt CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE IfStmt CLOSEB");}//{printf("IF case 5");}
	|IF OPENB Expression Block ELSE  Block CLOSEB {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE  Block CLOSEB");}//{printf("IF case 6");}
	;

ForStmt:
	FOR OPENB Condition Block CLOSEB {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB Condition Block CLOSEB");}
	|FOR OPENB ForClause Block CLOSEB {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB ForClause Block CLOSEB");}
	;
Condition:
	Expression {lhs.push_back("Condition");rhs.push_back("Expression");};

ForClause:
	InitStmt SEMICOLON Condition SEMICOLON PostStmt {lhs.push_back("ForClause");rhs.push_back("InitStmt SEMICOLON Condition SEMICOLON PostStmt");}
	;
InitStmt:
	SimpleStmt {lhs.push_back("InitStmt");rhs.push_back("SimpleStmt");};
PostStmt:
	SimpleStmt {lhs.push_back("PostStmt");rhs.push_back("SimpleStmt");};

int_lit:
	INTEGER{lhs.push_back("int_lit");rhs.push_back("INTEGER");}
	;
float_lit:
	  FLOAT{lhs.push_back("float_lit");rhs.push_back("FLOAT");}
	  ;



TypeName:
	IDENTIFIER {lhs.push_back("TypeName");rhs.push_back("IDENTIFIER");}
	| VAR_TYPE {lhs.push_back("TypeName");rhs.push_back("VAR_TYPE");}
	;



ArrayType:
	LEFTBRACKET ArrayLength RIGHTBRACKET Type{lhs.push_back("ArrayType");rhs.push_back("LEFTBRACKET ArrayLength RIGHTBRACKET Type");}
	;

ArrayLength:
	Expression{lhs.push_back("ArrayLength");rhs.push_back("Expression");}
	;

StructType:
    STRUCT LEFTBRACE FieldDeclList RIGHTBRACE {lhs.push_back("StructType");rhs.push_back("STRUCT LEFTBRACE FieldDeclList RIGHTBRACE");}
    | STRUCT LEFTBRACE RIGHTBRACE {lhs.push_back("StructType");rhs.push_back("STRUCT LEFTBRACE RIGHTBRACE");}
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
	STRING {lhs.push_back("Tag");rhs.push_back("STRING");}
	;

PointerType:
	MULTIPLY BaseType {lhs.push_back("PointerType");rhs.push_back("MULTIPLY BaseType");}
	;
BaseType:
	Type {lhs.push_back("BaseType");rhs.push_back("Type");}
	;

FunctionType:
	FUNC Signature {lhs.push_back("FunctionType");rhs.push_back("FUNC Signature");}
	;

ConstDecl:
		CONST ConstSpec {lhs.push_back("ConstDecl");rhs.push_back("CONST ConstSpec");}//{printf("at constant declaration");}
		;

ConstSpec:
		IDENTIFIER Type ASSIGN Expression {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type ASSIGN Expression");}
		| IDENTIFIER Type {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type");}
		;

ExpressionList:
		ExpressionList COMMA Expression {lhs.push_back("ExpressionList");rhs.push_back("ExpressionList COMMA Expression");}
		| Expression {lhs.push_back("ExpressionList");rhs.push_back("Expression");}
		;

TypeDecl:
		TYPE  TypeSpec {lhs.push_back("TypeDecl");rhs.push_back("TYPE  TypeSpec");}
		| TYPE LEFTPARANTHESES TypeSpecList RIGHTPARANTHESES {lhs.push_back("TypeDecl");rhs.push_back("TYPE LEFTPARANTHESES TypeSpecList RIGHTPARANTHESES");};

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
	BasicLit {lhs.push_back("Literal");rhs.push_back("BasicLit");}
	| FunctionLit {lhs.push_back("Literal");rhs.push_back("FunctionLit");}
	;

string_lit:
	STRING {lhs.push_back("string_lit");rhs.push_back("STRING");}
	;

//added later
byte_lit:
	BYTE {lhs.push_back("byte_lit");rhs.push_back("BYTE");}
	;
	
BasicLit:
	int_lit {lhs.push_back("BasicLit");rhs.push_back("int_lit");}
	| float_lit {lhs.push_back("BasicLit");rhs.push_back("float_lit");}
	| string_lit {lhs.push_back("BasicLit");rhs.push_back("string_lit");}
	| byte_lit {lhs.push_back("BasicLit");rhs.push_back("byte_lit");}	//added later
	;


FunctionLit:
	FUNC Function {lhs.push_back("FunctionLit");rhs.push_back("FUNC Function");};
//-----------------------------------------------------------------------------start
PrimaryExpr:
	Operand {lhs.push_back("PrimaryExpr");rhs.push_back("Operand");}|
	PrimaryExpr Selector {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Selector");}|
	PrimaryExpr Index {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Index");}|
	PrimaryExpr TypeAssertion {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr TypeAssertion");}|
	OperandName StructLiteral {lhs.push_back("PrimaryExpr");rhs.push_back("OperandName StructLiteral");}
	;
//------------------------------------------------------------------------------end
//here struct literal
StructLiteral:
    LEFTBRACE KeyValList RIGHTBRACE {lhs.push_back("StructLiteral");rhs.push_back("LEFTBRACE KeyValList RIGHTBRACE");}
    ;

KeyValList:
    	/* empty */  {lhs.push_back("KeyValList");rhs.push_back("/* empty */");}
 	| Expression COLON Expression {lhs.push_back("KeyValList");rhs.push_back("Expression COLON Expression");}
	| KeyValList COMMA Expression COLON Expression  {lhs.push_back("KeyValList");rhs.push_back("KeyValList COMMA Expression COLON Expression");}
	;
Selector:
	PERIOD IDENTIFIER {lhs.push_back("Selector");rhs.push_back("PERIOD IDENTIFIER");};
Index:	
	LEFTBRACKET Expression RIGHTBRACKET {lhs.push_back("Index");rhs.push_back("LEFTBRACKET Expression RIGHTBRACKET");};
TypeAssertion:
	PERIOD LEFTPARANTHESES Type RIGHTPARANTHESES {lhs.push_back("TypeAssertion");rhs.push_back("PERIOD LEFTPARANTHESES Type RIGHTPARANTHESES");}
	;
Expression:
    Expression1 {lhs.push_back("Expression");rhs.push_back("Expression1");}
    ;
Expression1:
    Expression1 LOR Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression1 LOR Expression2");}
    | Expression2 {lhs.push_back("Expression1");rhs.push_back("Expression2");}
    ;
Expression2:
    Expression2 LAND Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression2 LAND Expression3");}
    | Expression3 {lhs.push_back("Expression2");rhs.push_back("Expression3");}
    ;
Expression3:
    Expression3 rel_op Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression3 rel_op Expression4");}
    | Expression4 {lhs.push_back("Expression3");rhs.push_back("Expression4");}
    ;
Expression4:
    Expression4 add_op Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression4 add_op Expression5");}
    | Expression5 {lhs.push_back("Expression4");rhs.push_back("Expression5");}
    ;
Expression5:
    Expression5 mul_op PrimaryExpr {lhs.push_back("Expression5");rhs.push_back("Expression5 mul_op PrimaryExpr");}
    | UnaryExpr {lhs.push_back("Expression5");rhs.push_back("UnaryExpr");}
    ;
UnaryExpr:
	PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("PrimaryExpr");}
	| unary_op PrimaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("unary_op PrimaryExpr");}
	//UnaryExpr {lhs.push_back("UnaryExpr");rhs.push_back("UnaryExpr");}
	;

//ops using tokens
/*
binary_op:
	LOR {lhs.push_back("binary_op");rhs.push_back("LOR");}
	| LAND {lhs.push_back("binary_op");rhs.push_back("LAND");}
	| rel_op {lhs.push_back("binary_op");rhs.push_back("rel_op");}
	| add_op {lhs.push_back("binary_op");rhs.push_back("add_op");}
	| mul_op {lhs.push_back("binary_op");rhs.push_back("mul_op");};*/
rel_op:
	EQL {lhs.push_back("rel_op");rhs.push_back("EQL");}
	| NEQ {lhs.push_back("rel_op");rhs.push_back("NEQ");}
	| LSR {lhs.push_back("rel_op");rhs.push_back("LSR");}
	| LEQ {lhs.push_back("rel_op");rhs.push_back("LEQ");}
	| GTR {lhs.push_back("rel_op");rhs.push_back("GTR");}
	| GEQ {lhs.push_back("rel_op");rhs.push_back("GEQ");};
add_op:
	ADD {lhs.push_back("add_op");rhs.push_back("ADD");}
	| MINUS {lhs.push_back("add_op");rhs.push_back("SUB");}
	| OR {lhs.push_back("add_op");rhs.push_back("OR");}
	| XOR {lhs.push_back("add_op");rhs.push_back("XOR");};
mul_op:
	MULTIPLY {lhs.push_back("mul_op");rhs.push_back("MUL");}
	| DIVIDE {lhs.push_back("mul_op");rhs.push_back("QUO");}
	| MOD{lhs.push_back("mul_op");rhs.push_back("REM");}
	| SHL {lhs.push_back("mul_op");rhs.push_back("SHL");}
	| SHR {lhs.push_back("mul_op");rhs.push_back("SHR");}
	| AND {lhs.push_back("mul_op");rhs.push_back("AND");}
	| AND_NOT {lhs.push_back("mul_op");rhs.push_back("AND_NOT");};
//-------------------------------------------------------------------------------------------start
unary_op:
	ADD {lhs.push_back("unary_op");rhs.push_back("ADD");}
	| MINUS {lhs.push_back("unary_op");rhs.push_back("SUB");}
	| NOT {lhs.push_back("unary_op");rhs.push_back("NOT");}
	| XOR {lhs.push_back("unary_op");rhs.push_back("XOR");}
	| MULTIPLY {lhs.push_back("unary_op");rhs.push_back("MUL");}
	| AND {lhs.push_back("unary_op");rhs.push_back("AND");}
	;
//----------------------------------------------------------------------------------------------------------------end

assign_op:
	  ASSIGN {lhs.push_back("assign_op");rhs.push_back("ASSIGN");}
	;
/*IfStmt shift/reduce conflict*/

PackageClause:
	/*PACKAGE*/PACKAGE PackageName {lhs.push_back("PackageClause");rhs.push_back("PACKAGE PackageName");}//{printf("here i get package");}
	;
PackageName:
	IDENTIFIER {lhs.push_back("PackageName");rhs.push_back("IDENTIFIER");}//{printf("-----************package1--------");}
	;
	
ImportDeclList:
    //* empty */ {  }    |
      ImportDeclList ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDeclList ImportDecl");}//{ printf("got import list 1");}
    | ImportDecl  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDecl");}//{ printf("got import list 2"); }
    | /*empty*/ {lhs.push_back("ImportDeclList");rhs.push_back("/*empty*/");}//{ printf("got import list 3");}
	;

ImportDecl:
	IMPORT ImportSpec {lhs.push_back("ImportDecl");rhs.push_back("IMPORT ImportSpec SEMICOLON");}//{printf("got imports 1");}
	| IMPORT LEFTPARANTHESES ImportSpecList  RIGHTPARANTHESES {lhs.push_back("ImportDecl");rhs.push_back("IMPORT LEFTPARANTHESES ImportSpecList  RIGHTPARANTHESES");}//{printf("got imports 2");}
	;

ImportSpecList:
	ImportSpecList ImportSpec {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpecList ImportSpec SEMICOLON");}
	| ImportSpec {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpec SEMICOLON");}
	;
ImportSpec:
	 PERIOD ImportPath {lhs.push_back("ImportSpec");rhs.push_back("PERIOD ImportPath");}
	| PackageName2 ImportPath {lhs.push_back("ImportSpec");rhs.push_back("PackageName2 ImportPath");}
	| PackageName2 {lhs.push_back("ImportSpec");rhs.push_back("PackageName2");};
ImportPath:
	string_lit {lhs.push_back("ImportPath");rhs.push_back("string_lit");}|
	string_lit SEMICOLON {lhs.push_back("ImportPath");rhs.push_back("string_lit SEMICOLON");}
	;
PackageName2:
	string_lit {lhs.push_back("PackageName2");rhs.push_back("string_lit");}	|
	string_lit SEMICOLON {lhs.push_back("PackageName2");rhs.push_back("string_lit SEMICOLON");}	
	;

%%


int main (int argc, char** argv) {	
	printf("Inside main\n");
	FILE * fp= fopen(argv[1], "r");
	yyin = fp;
	printf("Read the input file, continue with Lexing and Parsing\n");
	printf("Performing Lexical analysis......\n\n");
	yyparse ( );
	printf("Parsing completed.\n\n");
	printf("Symbol Table after Lexical Analysis: \n");
	Display();
	/*
	reverse(lhs.begin(),lhs.end());
	reverse(rhs.begin(),rhs.end());
	fstream grammar;
	grammar.open("grammar.txt",ios_base::out);
	for(int i=0;i<lhs.size();i++){
			grammar << lhs[i] << " -> "<< rhs[i] << "$" << endl;
	}
	grammar.close();
	*/
	return 0;
}