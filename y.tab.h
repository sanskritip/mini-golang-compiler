/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PACKAGE = 258,
    IMPORT = 259,
    FUNC = 260,
    BREAK = 261,
    CASE = 262,
    CONST = 263,
    CONTINUE = 264,
    DEFAULT = 265,
    ELSE = 266,
    FOR = 267,
    GO = 268,
    IF = 269,
    RANGE = 270,
    RETURN = 271,
    STRUCT = 272,
    SWITCH = 273,
    TYPE = 274,
    VAR = 275,
    VAR_TYPE = 276,
    BOOL_CONST = 277,
    NIL_VAL = 278,
    IDENTIFIER = 279,
    BYTE = 280,
    STRING = 281,
    ELLIPSIS = 282,
    SHL = 283,
    SHR = 284,
    INC = 285,
    DEC = 286,
    INTEGER = 287,
    FLOAT = 288,
    ADD = 289,
    SUB = 290,
    MUL = 291,
    QUO = 292,
    REM = 293,
    ASSIGN = 294,
    AND = 295,
    NOT = 296,
    DEFINE = 297,
    AND_NOT = 298,
    OR = 299,
    XOR = 300,
    ARROW = 301,
    ADD_ASSIGN = 302,
    SUB_ASSIGN = 303,
    MUL_ASSIGN = 304,
    QUO_ASSIGN = 305,
    REM_ASSIGN = 306,
    AND_ASSIGN = 307,
    OR_ASSIGN = 308,
    XOR_ASSIGN = 309,
    SHL_ASSIGN = 310,
    SHR_ASSIGN = 311,
    AND_NOT_ASSIGN = 312,
    COLON = 313,
    LAND = 314,
    LOR = 315,
    EQL = 316,
    NEQ = 317,
    LEQ = 318,
    GEQ = 319,
    SEMICOLON = 320,
    GTR = 321,
    LSS = 322,
    LPAREN = 323,
    RPAREN = 324,
    LBRACE = 325,
    RBRACE = 326,
    LBRACK = 327,
    RBRACK = 328,
    COMMA = 329,
    PERIOD = 330
  };
#endif
/* Tokens.  */
#define PACKAGE 258
#define IMPORT 259
#define FUNC 260
#define BREAK 261
#define CASE 262
#define CONST 263
#define CONTINUE 264
#define DEFAULT 265
#define ELSE 266
#define FOR 267
#define GO 268
#define IF 269
#define RANGE 270
#define RETURN 271
#define STRUCT 272
#define SWITCH 273
#define TYPE 274
#define VAR 275
#define VAR_TYPE 276
#define BOOL_CONST 277
#define NIL_VAL 278
#define IDENTIFIER 279
#define BYTE 280
#define STRING 281
#define ELLIPSIS 282
#define SHL 283
#define SHR 284
#define INC 285
#define DEC 286
#define INTEGER 287
#define FLOAT 288
#define ADD 289
#define SUB 290
#define MUL 291
#define QUO 292
#define REM 293
#define ASSIGN 294
#define AND 295
#define NOT 296
#define DEFINE 297
#define AND_NOT 298
#define OR 299
#define XOR 300
#define ARROW 301
#define ADD_ASSIGN 302
#define SUB_ASSIGN 303
#define MUL_ASSIGN 304
#define QUO_ASSIGN 305
#define REM_ASSIGN 306
#define AND_ASSIGN 307
#define OR_ASSIGN 308
#define XOR_ASSIGN 309
#define SHL_ASSIGN 310
#define SHR_ASSIGN 311
#define AND_NOT_ASSIGN 312
#define COLON 313
#define LAND 314
#define LOR 315
#define EQL 316
#define NEQ 317
#define LEQ 318
#define GEQ 319
#define SEMICOLON 320
#define GTR 321
#define LSS 322
#define LPAREN 323
#define RPAREN 324
#define LBRACE 325
#define RBRACE 326
#define LBRACK 327
#define RBRACK 328
#define COMMA 329
#define PERIOD 330

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 21 "src/yacc.y"

     char *nt;
     char *sval;

#line 212 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
