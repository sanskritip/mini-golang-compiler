
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
LETTER				[a-zA-Z_]
DIGIT				[0-9]
UNICODE_CHAR			[^\n]
NEW_LINE			[\n]
VAR_TYPE			"bool"|"byte"|"error"|"float32"|"float64"|"int"|"int8"|"int16"|"int32"|"int64"|"rune"|"string"|"uint"|"uint8 "|"uint16"|"uint32"|"uint64"|"uintptr"
BOOL_CONST			"true"|"false"
NIL_VAL				"nil"

%%

"="				{printf("(%s, ASSIGN)\n", yytext);Insert(yytext,yylineno,"ASSIGN");return ASSIGN;}
"+"				{printf("(%s, ADD)\n", yytext);Insert(yytext,yylineno,"ADD");return ADD;}
"-"				{printf("(%s, MINUS)\n", yytext);Insert(yytext,yylineno,"MINUS");return MINUS;}
"*"				{printf("(%s, MULTIPLY)\n", yytext);Insert(yytext,yylineno,"MULTIPLY");return MULTIPLY;}
"/"				{printf("(%s, DIVIDE)\n", yytext);Insert(yytext,yylineno,"DIVIDE");return DIVIDE;}
"%"				{printf("(%s, MOD)\n", yytext);Insert(yytext,yylineno,"MOD");return MOD;}

"&&"				{printf("(%s, LAND)\n", yytext);Insert(yytext,yylineno,"LAND");return LAND;}
"||"				{printf("(%s, LOR)\n", yytext);Insert(yytext,yylineno,"LOR");return LOR;}
"->"				{printf("(%s, ARROW)\n", yytext);Insert(yytext,yylineno,"ARROW");return ARROW;}
"++"				{printf("(%s, INCREMENT)\n", yytext);Insert(yytext,yylineno,"INCREMENT");return INCREMENT;}
"--"				{printf("(%s, DECREMENT)\n", yytext);Insert(yytext,yylineno,"DECREMENT");return DECREMENT;}


"=="			{printf("(%s, EQL)\n", yytext);Insert(yytext,yylineno,"EQL");return EQL;}
">"				{printf("(%s, GTR)\n", yytext);Insert(yytext,yylineno,"GTR");return GTR;}
"<"				{printf("(%s, LSR)\n", yytext);Insert(yytext,yylineno,"LSR");return LSR;}
"!"				{printf("(%s, NOT)\n", yytext);Insert(yytext,yylineno,"NOT");return NOT;}

"!="			{printf("(%s, NEQ)\n", yytext);Insert(yytext,yylineno,"NEQ");return NEQ; }
"<="			{printf("(%s, LEQ)\n", yytext);Insert(yytext,yylineno,"LEQ");return LEQ;}
">="			{printf("(%s, GEQ)\n", yytext);Insert(yytext,yylineno,"GEQ");return GEQ;}
":="			{printf("(%s, DEFINE)\n", yytext);Insert(yytext,yylineno,"DEFINE");return DEFINE;}

"("				{printf("(%s, LEFTPARANTHESES)\n", yytext);return LEFTPARANTHESES;}
")"				{printf("(%s, RIGHTPARANTHESES)\n", yytext);return RIGHTPARANTHESES;}
"{"				{printf("(%s, LEFTBRACE)\n", yytext);return LEFTBRACE;}
"}"				{printf("(%s, RIGHTBRACE)\n", yytext);return RIGHTBRACE;}
"["				{printf("(%s, LEFTBRACKET)\n", yytext);return LEFTBRACKET;}
"]"				{printf("(%s, RIGHTBRACKET)\n", yytext);return RIGHTBRACKET;}
","				{printf("(%s, COMMA)\n", yytext);Insert(yytext,yylineno,"COMMA");return COMMA;}
";"				{printf("(%s, SEMICOLON)\n", yytext);Insert(yytext,yylineno,"SEMICOLON");return SEMICOLON;}
":"				{printf("(%s, COLON)\n", yytext);Insert(yytext,yylineno,"COLON");return COLON;}
"."				{printf("(%s, PERIOD)\n", yytext);Insert(yytext,yylineno,"PERIOD");return PERIOD;}

"package"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return PACKAGE;}
"import"			{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return IMPORT;}
"func"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return FUNC;}
"break"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return BREAK;} 
"case"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return CASE;}
"const"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return CONST;} 
"continue"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return CONTINUE;} 
"default"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return DEFAULT;} 
"else"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return ELSE;}
"for"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return FOR;}
"go"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return GO;}
"if"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return IF;}
"range"				{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return RANGE;}
"return"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return RETURN;}
"struct"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return STRUCT;}
"switch"        	{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return SWITCH;} 
"type"       		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return TYPE;} 
"var"        		{printf("(%s, KEYWORD)\n", yytext);Insert(yytext,yylineno,"KEYWORD");return VAR;}
{VAR_TYPE}			{printf("(%s, DATA TYPE)\n", yytext);Insert(yytext,yylineno,"DATA TYPE");return VAR_TYPE;}
{BOOL_CONST}		{printf("(%s, BOOLEAN CONSTANT)\n", yytext);Insert(yytext,yylineno,"BOOLEAN CONSTANT");return BOOL_CONST;}
{NIL_VAL}			{printf("(%s, NULL)\n", yytext);Insert(yytext,yylineno,"NULL");return NIL_VAL;}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, IDENTIFIER)\n", yytext);Insert(yytext,yylineno,"IDENTIFIER");return IDENTIFIER;}
{DIGIT}+			{printf("(%s, INTEGER)\n", yytext);Insert(yytext,yylineno,"INTEGER");return INTEGER;}
{DIGIT}+"."{DIGIT}+		{printf("(%s, FLOAT)\n", yytext);Insert(yytext,yylineno,"FLOAT");return FLOAT;}
\'{UNICODE_CHAR}\'  		{printf("(%s, BYTE)\n", yytext);Insert(yytext,yylineno,"BYTE");return BYTE;}

\"([^\\\n\"]|(\\.))*\"	{printf("(%s, STRING)\n", yytext);Insert(yytext,yylineno,"STRING");return STRING;}
\/\/{UNICODE_CHAR}*\n		;
"\n"				;
"\t"				;
" "				;
%%

int yywrap()
{
    return 1;
}
