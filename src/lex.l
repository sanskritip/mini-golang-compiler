
%{
	#include <stdio.h>
    #include<string.h>
    #include<errno.h>
    #include "src/SymbolTable.h"
    #include "y.tab.h"    /* token codes from the parser */  
    int yylex();
    void yyerror (const char* s);
    extern int errno;
%}

%option nounput yylineno

UNICODE_LETTER			[a-zA-Z]
LETTER				    [a-zA-Z_]
DIGIT				    [0-9]
UNICODE_CHAR			[^\n]
NEW_LINE			    [\n]
VAR_TYPE			    "bool"|"error"|"float32"|"float64"|"int"|"string"
BOOL_CONST			    "true"|"false"
NIL_VAL				    "nil"
WHITESPACE		        [ \t\f\r\v]+

%%

"="				{printf("(%s, T_ASSIGN)\n", yytext);Insert(yytext,yylineno,"T_ASSIGN",false,0);return T_ASSIGN;}
"+"				{printf("(%s, T_ADD)\n", yytext);Insert(yytext,yylineno,"T_ADD",false,0);return T_ADD;}
"-"				{printf("(%s, T_MINUS)\n", yytext);Insert(yytext,yylineno,"T_MINUS",false,0);return T_MINUS;}
"*"				{printf("(%s, T_MULTIPLY)\n", yytext);Insert(yytext,yylineno,"T_MULTIPLY",false,0);return T_MULTIPLY;}
"/"				{printf("(%s, T_DIVIDE)\n", yytext);Insert(yytext,yylineno,"T_DIVIDE",false,0);return T_DIVIDE;}
"%"				{printf("(%s, T_MOD)\n", yytext);Insert(yytext,yylineno,"T_MOD",false,0);return T_MOD;}

"&&"				{printf("(%s, T_LAND)\n", yytext);Insert(yytext,yylineno,"T_LAND",false,0);return T_LAND;}
"||"				{printf("(%s, T_LOR)\n", yytext);Insert(yytext,yylineno,"T_LOR",false,0);return T_LOR;}
"++"				{printf("(%s, T_INCREMENT)\n", yytext);Insert(yytext,yylineno,"T_INCREMENT",false,0);return T_INCREMENT;}
"--"				{printf("(%s, T_DECREMENT)\n", yytext);Insert(yytext,yylineno,"T_DECREMENT",false,0);return T_DECREMENT;}


"=="			{printf("(%s, T_EQL)\n", yytext);Insert(yytext,yylineno,"T_EQL",false,0);return T_EQL;}
">"				{printf("(%s, T_GTR)\n", yytext);Insert(yytext,yylineno,"T_GTR",false,0);return T_GTR;}
"<"				{printf("(%s, T_LSR)\n", yytext);Insert(yytext,yylineno,"T_LSR",false,0);return T_LSR;}
"!"				{printf("(%s, T_NOT)\n", yytext);Insert(yytext,yylineno,"T_NOT",false,0);return T_NOT;}

"!="			{printf("(%s, T_NEQ)\n", yytext);Insert(yytext,yylineno,"T_NEQ",false,0);return T_NEQ; }
"<="			{printf("(%s, T_LEQ)\n", yytext);Insert(yytext,yylineno,"T_LEQ",false,0);return T_LEQ;}
">="			{printf("(%s, T_GEQ)\n", yytext);Insert(yytext,yylineno,"T_GEQ",false,0);return T_GEQ;}

"("				{printf("(%s, T_LEFTPARANTHESES)\n", yytext,false,0);return T_LEFTPARANTHESES;}
")"				{printf("(%s, T_RIGHTPARANTHESES)\n", yytext,false,0);return T_RIGHTPARANTHESES;}
"{"				{printf("(%s, T_LEFTBRACE)\n", yytext,false,0);return T_LEFTBRACE;}
"}"				{printf("(%s, T_RIGHTBRACE)\n", yytext,false,0);return T_RIGHTBRACE;}
"["				{printf("(%s, T_LEFTBRACKET)\n", yytext,false,0);return T_LEFTBRACKET;}
"]"				{printf("(%s, T_RIGHTBRACKET)\n", yytext,false,0);return T_RIGHTBRACKET;}
","				{printf("(%s, T_COMMA)\n", yytext);Insert(yytext,yylineno,"T_COMMA",false,0);return T_COMMA;}
";"				{printf("(%s, T_SEMICOLON)\n", yytext);Insert(yytext,yylineno,"T_SEMICOLON",false,0);return T_SEMICOLON;}
"."				{printf("(%s, T_PERIOD)\n", yytext);Insert(yytext,yylineno,"T_PERIOD",false,0);return T_PERIOD;}

"package"			{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_PACKAGE;}
"import"			{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_IMPORT;}
"func"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_FUNC;}
"break"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_BREAK;} 
"const"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_CONST;} 
"continue"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_CONTINUE;} 
"else"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_ELSE;}
"for"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_FOR;}
"if"				{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_IF;}
"return"        	{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_RETURN;}
"var"        		{printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD",false,0);return T_VAR;}
{VAR_TYPE}			{printf("(%s, T_DATA TYPE)\n", yytext);Insert(yytext,yylineno,"T_DATA TYPE",false,0);return T_VAR_TYPE;}
{BOOL_CONST}		{yylval.sval = strdup(yytext);printf("(%s, T_BOOLEAN CONSTANT)\n", yytext);Insert(yytext,yylineno,"T_BOOLEAN CONSTANT",false,0);return T_BOOL_CONST;}
{NIL_VAL}			{yylval.sval = strdup(yytext);printf("(%s, T_NULL)\n", yytext);Insert(yytext,yylineno,"T_NULL",false,0);return T_NIL_VAL;}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, T_IDENTIFIER)\n", yytext);Insert(yytext,yylineno,"T_IDENTIFIER",false,0);return T_IDENTIFIER;}
{DIGIT}+			{yylval.nval = strtod(yytext,NULL);printf("(%s, T_INTEGER)\n", yytext);Insert(yytext,yylineno,"T_INTEGER",true, yylval.nval);return T_INTEGER;}
{DIGIT}+"."{DIGIT}+		{yylval.nval = strtod(yytext,NULL);printf("(%s, T_FLOAT)\n", yytext);Insert(yytext,yylineno,"T_FLOAT",true, yylval.nval);return T_FLOAT;}
\'{UNICODE_CHAR}\'  		{yylval.sval = strdup(yytext);printf("(%s, T_BYTE)\n", yytext);Insert(yytext,yylineno,"T_BYTE",false,0);return T_BYTE;}

\"([^\\\n\"]|(\\.))*\"	{yylval.sval = strdup(yytext);printf("(%s, T_STRING)\n", yytext);Insert(yytext,yylineno,"T_STRING",false,0);return T_STRING;}
\/\/{UNICODE_CHAR}*\n		;

"\n"				;
"\t"				;
{WHITESPACE}				;
. {yyerror("Lexical error unexpected");}

%%

int yywrap()
{
    printf("Input Exhausted!\n");
    return 1;
}
