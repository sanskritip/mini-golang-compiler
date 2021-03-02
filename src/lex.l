
%{
	#include <stdio.h>
    #include<string.h>
    #include "src/SymbolTable.h"
    #include "y.tab.h"    /* token codes from the parser */  
    int yylex();
    void yyerror (char *s);

%}

%option nounput yylineno
UNICODE_LETTER			[a-zA-Z]
LETTER				    [a-zA-Z_]
DIGIT				    [0-9]
UNICODE_CHAR			[^\n]
NEW_LINE			    [\n]
VAR_TYPE			    "bool"|"error"|"float32"|"float64"|"int"|"int64"|"string"
BOOL_CONST			    "true"|"false"
NIL_VAL				    "nil"

%%

"="				{printf("(%s, T_ASSIGN)\n", yytext);Insert(yytext,yylineno,"T_ASSIGN");return T_ASSIGN;}
"+"				{printf("(%s, T_ADD)\n", yytext);Insert(yytext,yylineno,"T_ADD");return T_ADD;}
"-"				{printf("(%s, T_MINUS)\n", yytext);Insert(yytext,yylineno,"T_MINUS");return T_MINUS;}
"*"				{printf("(%s, T_MULTIPLY)\n", yytext);Insert(yytext,yylineno,"T_MULTIPLY");return T_MULTIPLY;}
"/"				{printf("(%s, T_DIVIDE)\n", yytext);Insert(yytext,yylineno,"T_DIVIDE");return T_DIVIDE;}
"%"				{printf("(%s, T_MOD)\n", yytext);Insert(yytext,yylineno,"T_MOD");return T_MOD;}

"&&"				{printf("(%s, T_LAND)\n", yytext);Insert(yytext,yylineno,"T_LAND");return T_LAND;}
"||"				{printf("(%s, T_LOR)\n", yytext);Insert(yytext,yylineno,"T_LOR");return T_LOR;}
"->"				{printf("(%s, T_ARROW)\n", yytext);Insert(yytext,yylineno,"T_ARROW");return T_ARROW;}
"++"				{printf("(%s, T_INCREMENT)\n", yytext);Insert(yytext,yylineno,"T_INCREMENT");return T_INCREMENT;}
"--"				{printf("(%s, T_DECREMENT)\n", yytext);Insert(yytext,yylineno,"T_DECREMENT");return T_DECREMENT;}


"=="			{printf("(%s, T_EQL)\n", yytext);Insert(yytext,yylineno,"T_EQL");return T_EQL;}
">"				{printf("(%s, T_GTR)\n", yytext);Insert(yytext,yylineno,"T_GTR");return T_GTR;}
"<"				{printf("(%s, T_LSR)\n", yytext);Insert(yytext,yylineno,"T_LSR");return T_LSR;}
"!"				{printf("(%s, T_NOT)\n", yytext);Insert(yytext,yylineno,"T_NOT");return T_NOT;}

"!="			{printf("(%s, T_NEQ)\n", yytext);Insert(yytext,yylineno,"T_NEQ");return T_NEQ; }
"<="			{printf("(%s, T_LEQ)\n", yytext);Insert(yytext,yylineno,"T_LEQ");return T_LEQ;}
">="			{printf("(%s, T_GEQ)\n", yytext);Insert(yytext,yylineno,"T_GEQ");return T_GEQ;}

"("				{printf("(%s, T_LEFTPARANTHESES)\n", yytext);return T_LEFTPARANTHESES;}
")"				{printf("(%s, T_RIGHTPARANTHESES)\n", yytext);return T_RIGHTPARANTHESES;}
"{"				{printf("(%s, T_LEFTBRACE)\n", yytext);return T_LEFTBRACE;}
"}"				{printf("(%s, T_RIGHTBRACE)\n", yytext);return T_RIGHTBRACE;}
"["				{printf("(%s, T_LEFTBRACKET)\n", yytext);return T_LEFTBRACKET;}
"]"				{printf("(%s, T_RIGHTBRACKET)\n", yytext);return T_RIGHTBRACKET;}
","				{printf("(%s, T_COMMA)\n", yytext);Insert(yytext,yylineno,"T_COMMA");return T_COMMA;}
";"				{printf("(%s, T_SEMICOLON)\n", yytext);Insert(yytext,yylineno,"T_SEMICOLON");return T_SEMICOLON;}
":"				{printf("(%s, T_COLON)\n", yytext);Insert(yytext,yylineno,"T_COLON");return T_COLON;}
"."				{printf("(%s, T_PERIOD)\n", yytext);Insert(yytext,yylineno,"T_PERIOD");return T_PERIOD;}

"package"			{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_PACKAGE;}
"import"			{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_IMPORT;}
"func"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_FUNC;}
"break"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_BREAK;} 
"case"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_CASE;}
"const"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_CONST;} 
"continue"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_CONTINUE;} 
"default"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_DEFAULT;} 
"else"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_ELSE;}
"for"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_FOR;}
"go"        		{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_GO;}
"if"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_IF;}
"range"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_RANGE;}
"return"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_RETURN;}
"switch"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_SWITCH;} 
"type"       		{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_TYPE;} 
"var"        		{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_VAR;}
{VAR_TYPE}			{printf("(%s, T_DATA TYPE)\n", yytext);Insert(yytext,yylineno,"T_DATA TYPE");return T_VAR_TYPE;}
{BOOL_CONST}		{printf("(%s, T_BOOLEAN CONSTANT)\n", yytext);Insert(yytext,yylineno,"T_BOOLEAN CONSTANT");return T_BOOL_CONST;}
{NIL_VAL}			{printf("(%s, T_NULL)\n", yytext);Insert(yytext,yylineno,"T_NULL");return T_NIL_VAL;}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, T_IDENTIFIER)\n", yytext);Insert(yytext,yylineno,"T_IDENTIFIER");return T_IDENTIFIER;}
{DIGIT}+			{printf("(%s, T_INTEGER)\n", yytext);Insert(yytext,yylineno,"T_INTEGER");return T_INTEGER;}
{DIGIT}+"."{DIGIT}+		{printf("(%s, T_FLOAT)\n", yytext);Insert(yytext,yylineno,"T_FLOAT");return T_FLOAT;}
\'{UNICODE_CHAR}\'  		{printf("(%s, T_BYTE)\n", yytext);Insert(yytext,yylineno,"T_BYTE");return T_BYTE;}

\"([^\\\n\"]|(\\.))*\"	{printf("(%s, T_STRING)\n", yytext);Insert(yytext,yylineno,"T_STRING");return T_STRING;}
\/\/{UNICODE_CHAR}*\n		;
"\n"				;
"\t"				;
" "				;
%%

int yywrap()
{
    return 1;
}
