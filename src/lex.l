%option noyywrap
%{
	#include <stdio.h>
    #include<string.h>
    #include "src/SymbolTable.h"  
    // #include "yacc.tab.h"    /* token codes from the parser */  
%}
%option nounput yylineno
UNICODE_LETTER			[a-zA-Z]
LETTER				[a-zA-Z_]
DIGIT				[0-9]
UNICODE_CHAR			[^\n]
NEW_LINE			[\n]
VAR_TYPE			"bool"|"byte"|"error"|"float32"|"float64"|"int"|"int8"|"int16"|"int32"|"int64"|"rune"|"string"|"uint"|"uint8 "|"uint16"|"uint32"|"uint64"|"uintptr"
BOOL_CONST			"true"|"false"
NIL_VAL				"nil"


%%

"="				{printf("(%s, ASSIGN)\n", yytext);Insert(yytext,yylineno,"ASSIGN");}
"+"				{printf("(%s, ADD)\n", yytext);Insert(yytext,yylineno,"ADD");}
"-"				{printf("(%s, MINUS)\n", yytext);Insert(yytext,yylineno,"MINUS");}
"*"				{printf("(%s, MULTIPLY)\n", yytext);Insert(yytext,yylineno,"MULTIPLY");}
"/"				{printf("(%s, DIVIDE)\n", yytext);Insert(yytext,yylineno,"DIVIDE");}
"%"				{printf("(%s, MOD)\n", yytext);Insert(yytext,yylineno,"MOD");}

"&&"				{printf("(%s, LAND)\n", yytext);Insert(yytext,yylineno,"LAND");}
"||"				{printf("(%s, LOR)\n", yytext);Insert(yytext,yylineno,"LOR");}
"->"				{printf("(%s, ARROW)\n", yytext);Insert(yytext,yylineno,"ARROW");}
"++"				{printf("(%s, INCREMENT)\n", yytext);Insert(yytext,yylineno,"INCREMENT");}
"--"				{printf("(%s, DECREMENT)\n", yytext);Insert(yytext,yylineno,"DECREMENT");}

"=="			{printf("(%s, EQL)\n", yytext);Insert(yytext,yylineno,"EQL");}
">"				{printf("(%s, GTR)\n", yytext);Insert(yytext,yylineno,"GTR");}
"<"				{printf("(%s, LSR)\n", yytext);Insert(yytext,yylineno,"LSR");}
"!"				{printf("(%s, NOT)\n", yytext);Insert(yytext,yylineno,"NOT");}

"!="			{printf("(%s, NEQ)\n", yytext);Insert(yytext,yylineno,"NEQ");}
"<="			{printf("(%s, LEQ)\n", yytext);Insert(yytext,yylineno,"LEQ");}
">="			{printf("(%s, GEQ)\n", yytext);Insert(yytext,yylineno,"GEQ");}
":="			{printf("(%s, DEFINE)\n", yytext);Insert(yytext,yylineno,"DEFINE");}

"("				{printf("(%s, LEFTPARANTHESES)\n", yytext);}
")"				{printf("(%s, RIGHTPARANTHESES)\n", yytext);}
"{"				{printf("(%s, LEFTBRACE)\n", yytext);}
"}"				{printf("(%s, RIGHTBRACE)\n", yytext);}
"["				{printf("(%s, LEFTBRACKET)\n", yytext);}
"]"				{printf("(%s, RIGHTBRACKET)\n", yytext);}
","				{printf("(%s, COMMA)\n", yytext);Insert(yytext,yylineno,"COMMA");}
";"				{printf("(%s, SEMICOLON)\n", yytext);Insert(yytext,yylineno,"SEMICOLON");}
":"				{printf("(%s, COLON)\n", yytext);Insert(yytext,yylineno,"COLON");}
"."				{printf("(%s, PERIOD)\n", yytext);Insert(yytext,yylineno,"PERIOD");}

"package"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"import"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"func"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"break"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"case"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"const"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"continue"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"default"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"else"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"for"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"go"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"if"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"range"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"return"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"struct"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
"switch"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"type"       		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");} 
"var"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");}
{VAR_TYPE}			{printf("(%s, DATA TYPE)\n", yytext);Insert(yytext,yylineno,"DATA TYPE");}
{BOOL_CONST}		{printf("(%s, BOOLEAN CONSTANT)\n", yytext);Insert(yytext,yylineno,"BOOLEAN CONSTANT");}
{NIL_VAL}			{printf("(%s, NULL)\n", yytext);Insert(yytext,yylineno,"NULL");}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, IDENTIFIER)\n", yytext);Insert(yytext,yylineno,"IDENTIFIER");}
{DIGIT}+			{printf("(%s, INTEGER)\n", yytext);Insert(yytext,yylineno,"INTEGER");}
{DIGIT}+"."{DIGIT}+		{printf("(%s, FLOAT)\n", yytext);Insert(yytext,yylineno,"FLOAT");}
\'{UNICODE_CHAR}\'  		{printf("(%s, BYTE)\n", yytext);Insert(yytext,yylineno,"BYTE");}

\"([^\\\n\"]|(\\.))*\"	{printf("(%s, STRING)\n", yytext);Insert(yytext,yylineno,"STRING");}
\/\/{UNICODE_CHAR}*\n		;
"\n"				;
"\t"				;
" "				;
%%

int main(){
    yylex();
    printf("LEXING COMPLETED:\n");
    printf("Symbol Table after Lexical Analysis:\n");
    Display();
}

