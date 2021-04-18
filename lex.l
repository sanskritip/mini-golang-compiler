
%{
	#include <stdio.h>
    #include<string.h>
    #include<errno.h>
    //#include "src/SymbolTable.h"
    #include "y.tab.h"    /* token codes from the parser */ 
    int yylex();
    void yyerror (const char* s);
    extern int errno;
    #define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
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

"fmt.Println"		   {yylval.sval= strdup(yytext);printf("(%s, T_PRINT)\n", yytext);return T_PRINT;}

"="				{yylval.sval= strdup(yytext);return T_ASSIGN;}
"+"				{yylval.sval= strdup(yytext);return T_ADD;}
"-"				{yylval.sval= strdup(yytext);return T_MINUS;}
"*"				{yylval.sval= strdup(yytext);return T_MULTIPLY;}
"/"				{yylval.sval= strdup(yytext);return T_DIVIDE;}
"%"				{yylval.sval= strdup(yytext);return T_MOD;}

"&&"				{yylval.sval= strdup(yytext);return T_LAND;}
"||"				{yylval.sval= strdup(yytext);return T_LOR;}
"++"				{yylval.sval= strdup(yytext);return T_INCREMENT;}
"--"				{yylval.sval= strdup(yytext);return T_DECREMENT;}


"=="			{yylval.sval= strdup(yytext);return T_EQL;}
">"				{yylval.sval= strdup(yytext);return T_GTR;}
"<"				{yylval.sval= strdup(yytext);return T_LSR;}
"!"				{yylval.sval= strdup(yytext);return T_NOT;}

"!="			{yylval.sval= strdup(yytext);return T_NEQ;}
"<="			{yylval.sval= strdup(yytext);return T_LEQ;}
">="			{yylval.sval= strdup(yytext);return T_GEQ;}

"("				{yylval.sval= strdup(yytext);return T_LEFTPARANTHESES;}
")"				{yylval.sval= strdup(yytext);return T_RIGHTPARANTHESES;}
"{"				{yylval.sval= strdup(yytext);return T_LEFTBRACE;}
"}"				{yylval.sval= strdup(yytext);return T_RIGHTBRACE;}
"["				{yylval.sval= strdup(yytext);return T_LEFTBRACKET;}
"]"				{yylval.sval= strdup(yytext);return T_RIGHTBRACKET;}
","				{yylval.sval= strdup(yytext);return T_COMMA;}
";"				{yylval.sval= strdup(yytext);return T_SEMICOLON;}
"."				{yylval.sval= strdup(yytext);return T_PERIOD;}

"package"			{yylval.sval= strdup(yytext);return T_PACKAGE;}
"import"			{yylval.sval= strdup(yytext);return T_IMPORT;}
"func"				{yylval.sval= strdup(yytext);return T_FUNC;}
"break"				{yylval.sval= strdup(yytext);return T_BREAK;} 
"const"				{yylval.sval= strdup(yytext);return T_CONST;} 
"continue"        	{yylval.sval= strdup(yytext);return T_CONTINUE;} 
"else"				{yylval.sval= strdup(yytext);return T_ELSE;}
"for"				{yylval.sval= strdup(yytext);return T_FOR;}
"if"				{yylval.sval= strdup(yytext);return T_IF;}
"return"        	{yylval.sval= strdup(yytext);return T_RETURN;}
"var"        		{yylval.sval= strdup(yytext);return T_VAR;}
{VAR_TYPE}			{yylval.sval= strdup(yytext);return T_VAR_TYPE;}
{BOOL_CONST}		{yylval.sval= strdup(yytext);return T_BOOL_CONST;}
{NIL_VAL}			{yylval.sval= strdup(yytext);return T_NIL_VAL;}

{LETTER}({LETTER}|{DIGIT})*	{
    if(strlen(yytext)<=32)
        {yylval.sval= strdup(yytext);return T_IDENTIFIER;}
    else
    {
        printf ("\033[0;31m Line:%d | Identifier too long,must be between 1 to 32 characters \n\033[0m\n",yylineno);
        char newid[32];
        strncpy(newid,yytext,32);
        printf ("\033[0;36m Error handled , Identifier name %s replaced by %s \n\033[0m\n",yytext,newid);
        yylval.sval= strdup(newid);return T_IDENTIFIER;
    }
}
{DIGIT}+({LETTER}|_)+  {yyerror("Lexical Error : Illegal identifier format\n");}

{DIGIT}+			{yylval.sval= strdup(yytext);return T_INTEGER;}
{DIGIT}+"."{DIGIT}+		{ yylval.sval= strdup(yytext);return T_FLOAT;}

\"([^\"\n\"]|(\\.))*$   { yyerror("Lexical Error : Badly Terminated String\n");}
\"([^\\\n\"]|(\\.))*\"	{ yylval.sval= strdup(yytext);return T_STRING;}

\/\/{UNICODE_CHAR}*\n		;

"\n"				;
"\t"				;
{WHITESPACE}		;
. {yyerror("Lexical error : Unidentified token");}

%%

int yywrap()
{
    printf("Input Exhausted!\n");
    return 1;
}
