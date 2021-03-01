%option noyywrap
%{
	#include <stdio.h>
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

"="				{printf("(%s, assig)\n", yytext);}
"+"				{printf("(%s, addd)\n", yytext);}
"-"				{printf("(%s, minus)\n", yytext);}
"*"				{printf("(%s, multiply)\n", yytext);}
"/"				{printf("(%s, divide)\n", yytext);}
"%"				{printf("(%s, mod)\n", yytext);}

"&"			    {printf("(%s, BINARY AND)\n", yytext);}
"|"				{printf("(%s, BINARY OR)\n", yytext);}
"^"				{printf("(%s, BINARY XOR)\n", yytext);}
"<<"			{printf("(%s, LEFT SHIFT)\n", yytext);}
">>"			{printf("(%s, RIGHT SHIFT)\n", yytext);}
"&^"			{printf("(%s, WHAT IS THIS)\n", yytext);}

"+="				{printf("(%s, ADD-assign)\n", yytext);}
"-="				{printf("(%s, SUBSTRACT-assign)\n", yytext);}
"*="				{printf("(%s, MULTIPLY-assign)\n", yytext);}
"/="				{printf("(%s, DIVIDE-assign)\n", yytext);}
"%="				{printf("(%s, MOD-assign)\n", yytext);}

"&="				{printf("(%s, and_assign)\n", yytext);}
"|="				{printf("(%s, or_assign)\n", yytext);}
"^="				{printf("(%s, xor_assign)\n", yytext);}
"<<="				{printf("(%s, shl_assign)\n", yytext);}
">>="				{printf("(%s, shr_assign)\n", yytext);}
"&^="				{printf("(%s, and_not_assign)\n", yytext);}

"&&"				{printf("(%s, AND)\n", yytext);}
"||"				{printf("(%s, OR)\n", yytext);}
"->"				{printf("(%s, ARROW)\n", yytext);}
"++"				{printf("(%s, INCREMENT)\n", yytext);}
"--"				{printf("(%s, DECREMENT)\n", yytext);}

"=="			{printf("(%s, eql)\n", yytext);}
">"				{printf("(%s, gtr)\n", yytext);}
"<"				{printf("(%s, lss)\n", yytext);}
"!"				{printf("(%s, not)\n", yytext);}

"!="			{printf("(%s, neq)\n", yytext);}
"<="			{printf("(%s, leq)\n", yytext);}
">="			{printf("(%s, geq)\n", yytext);}
":="			{printf("(%s, define)\n", yytext);}
"..."			{printf("(%s, ellipsis)\n", yytext);}

"("				{printf("(%s, leftparentheses)\n", yytext);}
")"				{printf("(%s, rightparentheses)\n", yytext);}
"{"				{printf("(%s, leftbrace)\n", yytext);}
"}"				{printf("(%s, rightbrace)\n", yytext);}
"["				{printf("(%s, leftbracket)\n", yytext);}
"]"				{printf("(%s, rightbracket)\n", yytext);}
","				{printf("(%s, comma)\n", yytext);}
";"				{printf("(%s, semicolon)\n", yytext);}
":"				{printf("(%s, colon)\n", yytext);}
"."				{printf("(%s, period)\n", yytext);}

"package"			{printf("(%s, KEYWORD)\n", yytext);}
"import"			{printf("(%s, KEYWORD)\n", yytext);}
"func"				{printf("(%s, KEYWORD)\n", yytext);}
"break"				{printf("(%s, KEYWORD)\n", yytext);} 
"case"				{printf("(%s, KEYWORD)\n", yytext);}
"const"				{printf("(%s, KEYWORD)\n", yytext);} 
"continue"        	{printf("(%s, KEYWORD)\n", yytext);} 
"default"        	{printf("(%s, KEYWORD)\n", yytext);} 
"else"				{printf("(%s, KEYWORD)\n", yytext);}
"for"				{printf("(%s, KEYWORD)\n", yytext);}
"go"        		{printf("(%s, KEYWORD)\n", yytext);}
"if"				{printf("(%s, KEYWORD)\n", yytext);}
"range"				{printf("(%s, KEYWORD)\n", yytext);}
"return"        	{printf("(%s, KEYWORD)\n", yytext);}
"struct"        	{printf("(%s, KEYWORD)\n", yytext);}
"switch"        	{printf("(%s, KEYWORD)\n", yytext);} 
"type"       		{printf("(%s, KEYWORD)\n", yytext);} 
"var"        		{printf("(%s, KEYWORD)\n", yytext);}
{VAR_TYPE}			{printf("(%s, DATA TYPE)\n", yytext);}
{BOOL_CONST}		{printf("(%s, Boolean constant)\n", yytext);}
{NIL_VAL}			{printf("(%s, NULL)\n", yytext);}

{LETTER}({LETTER}|{DIGIT})*	{printf("(%s, IDENTIFIER)\n", yytext);}
{DIGIT}+			{printf("(%s, INTEGER)\n", yytext);}
{DIGIT}+"."{DIGIT}+		{printf("(%s, FLOAT)\n", yytext);}
\'{UNICODE_CHAR}\'  		{printf("(%s, BYTE)\n", yytext);}

\"([^\\\n\"]|(\\.))*\"	{printf("(%s, STRING)\n", yytext);} 
\/\/{UNICODE_CHAR}*\n		;
"\n"				;
"\t"				;
" "				;
.				printf("ERROR : unexpected character in line %d\n",yylineno);

%%


int main(int argv, char *argc[]){
    int y;
    char la[10];

    yylex();
    return 0;
}