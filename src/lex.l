%option noyywrap
%{
	#include <stdio.h>
    #include<string.h>
    #include "src/SymbolTable.h"    
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

"="				{printf("(%s, ASSIGN)\n", yytext);Insert(yytext,yylineno);}
"+"				{printf("(%s, ADD)\n", yytext);Insert(yytext,yylineno);}
"-"				{printf("(%s, MINUS)\n", yytext);Insert(yytext,yylineno);}
"*"				{printf("(%s, MULTIPLY)\n", yytext);Insert(yytext,yylineno);}
"/"				{printf("(%s, DIVIDE)\n", yytext);Insert(yytext,yylineno);}
"%"				{printf("(%s, MOD)\n", yytext);Insert(yytext,yylineno);}

"&&"				{printf("(%s, AND)\n", yytext);Insert(yytext,yylineno);}
"||"				{printf("(%s, OR)\n", yytext);Insert(yytext,yylineno);}
"->"				{printf("(%s, ARROW)\n", yytext);Insert(yytext,yylineno);}
"++"				{printf("(%s, INCREMENT)\n", yytext);Insert(yytext,yylineno);}
"--"				{printf("(%s, DECREMENT)\n", yytext);Insert(yytext,yylineno);}

"=="			{printf("(%s, EQL)\n", yytext);Insert(yytext,yylineno);}
">"				{printf("(%s, GTR)\n", yytext);Insert(yytext,yylineno);}
"<"				{printf("(%s, LSR)\n", yytext);Insert(yytext,yylineno);}
"!"				{printf("(%s, NOT)\n", yytext);Insert(yytext,yylineno);}

"!="			{printf("(%s, NEQ)\n", yytext);Insert(yytext,yylineno);}
"<="			{printf("(%s, LEQ)\n", yytext);Insert(yytext,yylineno);}
">="			{printf("(%s, GEQ)\n", yytext);Insert(yytext,yylineno);}
":="			{printf("(%s, DEFINE)\n", yytext);Insert(yytext,yylineno);}

"("				{printf("(%s, LEFTPARANTHESES)\n", yytext);Insert(yytext,yylineno);}
")"				{printf("(%s, RIGHTPARANTHESES)\n", yytext);Insert(yytext,yylineno);}
"{"				{printf("(%s, LEFTBRACE)\n", yytext);Insert(yytext,yylineno);}
"}"				{printf("(%s, RIGHTBRACE)\n", yytext);Insert(yytext,yylineno);}
"["				{printf("(%s, LEFTBRACKET)\n", yytext);Insert(yytext,yylineno);}
"]"				{printf("(%s, RIGHTBRACKET)\n", yytext);Insert(yytext,yylineno);}
","				{printf("(%s, COMMA)\n", yytext);Insert(yytext,yylineno);}
";"				{printf("(%s, SEMICOLON)\n", yytext);Insert(yytext,yylineno);}
":"				{printf("(%s, COLON)\n", yytext);Insert(yytext,yylineno);}
"."				{printf("(%s, PERIOD)\n", yytext);Insert(yytext,yylineno);}

"package"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"import"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"func"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"break"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"case"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"const"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"continue"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"default"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"else"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"for"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"go"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"if"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"range"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"return"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"struct"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
"switch"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"type"       		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);} 
"var"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno);}
{VAR_TYPE}			{printf("(%s, DATA TYPE)\n", yytext);Insert(yytext,yylineno);}
{BOOL_CONST}		{printf("(%s, Boolean constant)\n", yytext);Insert(yytext,yylineno);}
{NIL_VAL}			{printf("(%s, NULL)\n", yytext);Insert(yytext,yylineno);}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, IDENTIFIER)\n", yytext);Insert(yytext,yylineno);}
{DIGIT}+			{printf("(%s, INTEGER)\n", yytext);Insert(yytext,yylineno);}
{DIGIT}+"."{DIGIT}+		{printf("(%s, FLOAT)\n", yytext);Insert(yytext,yylineno);}
\'{UNICODE_CHAR}\'  		{printf("(%s, BYTE)\n", yytext);Insert(yytext,yylineno);}

\"([^\\\n\"]|(\\.))*\"	{printf("(%s, STRING)\n", yytext);Insert(yytext,yylineno);}
\/\/{UNICODE_CHAR}*\n		;
"\n"				;
"\t"				;
" "				;
%%

int main(){

	FILE *fp = fopen("test/test1.go", "r");
	if(fp)
			yyin = fp;
    yylex();
    printf("LEXING COMPLETED:\n");
    printf("Symbol Table after Lexical Analysis:\n");
    Display();
}

