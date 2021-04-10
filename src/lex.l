
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

"="				{yylval.sval = strdup(yytext);printf("(%s, T_ASSIGN)\n", yytext);Insert(yytext,yylineno,"T_ASSIGN");return T_ASSIGN;}
"+"				{yylval.sval = strdup(yytext);printf("(%s, T_ADD)\n", yytext);Insert(yytext,yylineno,"T_ADD");return T_ADD;}
"-"				{yylval.sval = strdup(yytext);printf("(%s, T_MINUS)\n", yytext);Insert(yytext,yylineno,"T_MINUS");return T_MINUS;}
"*"				{yylval.sval = strdup(yytext);printf("(%s, T_MULTIPLY)\n", yytext);Insert(yytext,yylineno,"T_MULTIPLY");return T_MULTIPLY;}
"/"				{yylval.sval = strdup(yytext);printf("(%s, T_DIVIDE)\n", yytext);Insert(yytext,yylineno,"T_DIVIDE");return T_DIVIDE;}
"%"				{yylval.sval = strdup(yytext);printf("(%s, T_MOD)\n", yytext);Insert(yytext,yylineno,"T_MOD");return T_MOD;}

"&&"				{yylval.sval = strdup(yytext);printf("(%s, T_LAND)\n", yytext);Insert(yytext,yylineno,"T_LAND");return T_LAND;}
"||"				{yylval.sval = strdup(yytext);printf("(%s, T_LOR)\n", yytext);Insert(yytext,yylineno,"T_LOR");return T_LOR;}
"++"				{yylval.sval = strdup(yytext);printf("(%s, T_INCREMENT)\n", yytext);Insert(yytext,yylineno,"T_INCREMENT");return T_INCREMENT;}
"--"				{yylval.sval = strdup(yytext);printf("(%s, T_DECREMENT)\n", yytext);Insert(yytext,yylineno,"T_DECREMENT");return T_DECREMENT;}


"=="			{yylval.sval = strdup(yytext);printf("(%s, T_EQL)\n", yytext);Insert(yytext,yylineno,"T_EQL");return T_EQL;}
">"				{yylval.sval = strdup(yytext);printf("(%s, T_GTR)\n", yytext);Insert(yytext,yylineno,"T_GTR");return T_GTR;}
"<"				{yylval.sval = strdup(yytext);printf("(%s, T_LSR)\n", yytext);Insert(yytext,yylineno,"T_LSR");return T_LSR;}
"!"				{yylval.sval = strdup(yytext);printf("(%s, T_NOT)\n", yytext);Insert(yytext,yylineno,"T_NOT");return T_NOT;}

"!="			{yylval.sval = strdup(yytext);printf("(%s, T_NEQ)\n", yytext);Insert(yytext,yylineno,"T_NEQ");return T_NEQ; }
"<="			{yylval.sval = strdup(yytext);printf("(%s, T_LEQ)\n", yytext);Insert(yytext,yylineno,"T_LEQ");return T_LEQ;}
">="			{yylval.sval = strdup(yytext);printf("(%s, T_GEQ)\n", yytext);Insert(yytext,yylineno,"T_GEQ");return T_GEQ;}

"("				{yylval.sval = strdup(yytext);printf("(%s, T_LEFTPARANTHESES)\n", yytext);return T_LEFTPARANTHESES;}
")"				{yylval.sval = strdup(yytext);printf("(%s, T_RIGHTPARANTHESES)\n", yytext);return T_RIGHTPARANTHESES;}
"{"				{yylval.sval = strdup(yytext);printf("(%s, T_LEFTBRACE)\n", yytext);return T_LEFTBRACE;}
"}"				{yylval.sval = strdup(yytext);printf("(%s, T_RIGHTBRACE)\n", yytext);return T_RIGHTBRACE;}
"["				{yylval.sval = strdup(yytext);printf("(%s, T_LEFTBRACKET)\n", yytext);return T_LEFTBRACKET;}
"]"				{yylval.sval = strdup(yytext);printf("(%s, T_RIGHTBRACKET)\n", yytext);return T_RIGHTBRACKET;}
","				{yylval.sval = strdup(yytext);printf("(%s, T_COMMA)\n", yytext);Insert(yytext,yylineno,"T_COMMA");return T_COMMA;}
";"				{yylval.sval = strdup(yytext);printf("(%s, T_SEMICOLON)\n", yytext);Insert(yytext,yylineno,"T_SEMICOLON");return T_SEMICOLON;}
"."				{yylval.sval = strdup(yytext);printf("(%s, T_PERIOD)\n", yytext);Insert(yytext,yylineno,"T_PERIOD");return T_PERIOD;}

"package"			{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_PACKAGE;}
"import"			{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_IMPORT;}
"func"				{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_FUNC;}
"const"				{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_CONST;} 
"else"				{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_ELSE;}
"for"				{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_FOR;}
"if"				{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_IF;}
"return"        	{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_RETURN;}
"var"        		{yylval.sval = strdup(yytext);printf("(%s, T_KEYWORD)\n", yytext);Insert(yytext,yylineno,"T_KEYWORD");return T_VAR;}
{VAR_TYPE}			{yylval.sval = strdup(yytext);printf("(%s, T_DATA TYPE)\n", yytext);Insert(yytext,yylineno,"T_DATA TYPE");return T_VAR_TYPE;}
{BOOL_CONST}		{yylval.sval = strdup(yytext);printf("(%s, T_BOOLEAN CONSTANT)\n", yytext);Insert(yytext,yylineno,"T_BOOLEAN CONSTANT");return T_BOOL_CONST;}
{NIL_VAL}			{yylval.sval = strdup(yytext);printf("(%s, T_NULL)\n", yytext);Insert(yytext,yylineno,"T_NULL");return T_NIL_VAL;}

{LETTER}({LETTER}|{DIGIT})*	{yylval.sval=strdup(yytext);printf("(%s, T_IDENTIFIER)\n", yytext);Insert(yytext,yylineno,"T_IDENTIFIER");return T_IDENTIFIER;}
{DIGIT}+			{yylval.nval = strtod(yytext,NULL);yylval.sval = strdup(yytext);printf("(%s, T_INTEGER)\n", yytext);Insert(yytext,yylineno,"T_INTEGER");return T_INTEGER;}
{DIGIT}+"."{DIGIT}+		{yylval.nval = strtod(yytext,NULL);yylval.sval = strdup(yytext);printf("(%s, T_FLOAT)\n", yytext);Insert(yytext,yylineno,"T_FLOAT");return T_FLOAT;}

\"([^\\\n\"]|(\\.))*\"	{yylval.sval = strdup(yytext);printf("(%s, T_STRING)\n", yytext);Insert(yytext,yylineno,"T_STRING");return T_STRING;}
\/\/{UNICODE_CHAR}*\n		;

"\n"				;
"\t"				;
{WHITESPACE}				;
. {yyerror("Lexical error unidentified token");}

%%

int yywrap()
{
    printf("Input Exhausted!\n");
    return 1;
}
