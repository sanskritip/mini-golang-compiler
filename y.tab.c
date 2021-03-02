/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "src/yacc.y"

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


#line 87 "y.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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

#line 294 "y.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_int16 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  6
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   332

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  76
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  100
/* YYNRULES -- Number of rules.  */
#define YYNRULES  206
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  324

#define YYUNDEFTOK  2
#define YYMAXUTOK   330


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    70,    70,    77,    83,    87,    91,    92,    96,    97,
      98,    99,   100,   101,   102,   103,   104,   105,   106,   109,
     110,   111,   115,   121,   123,   128,   129,   132,   136,   139,
     140,   145,   146,   147,   151,   152,   154,   156,   158,   162,
     164,   168,   172,   173,   174,   177,   178,   184,   185,   189,
     190,   193,   194,   195,   198,   199,   205,   206,   207,   211,
     212,   218,   219,   222,   223,   228,   229,   233,   236,   237,
     241,   242,   243,   247,   248,   249,   250,   257,   258,   262,
     263,   264,   267,   271,   272,   275,   276,   279,   280,   284,
     285,   286,   287,   288,   289,   293,   294,   297,   300,   303,
     305,   308,   311,   317,   318,   324,   328,   332,   333,   337,
     338,   342,   343,   347,   351,   354,   358,   362,   366,   367,
     371,   372,   376,   377,   380,   381,   384,   385,   388,   392,
     399,   400,   404,   409,   413,   414,   415,   416,   421,   424,
     425,   426,   427,   428,   433,   437,   438,   439,   444,   446,
     450,   454,   458,   459,   463,   464,   468,   469,   473,   474,
     478,   479,   485,   486,   499,   500,   501,   502,   503,   504,
     506,   507,   508,   509,   511,   512,   513,   514,   515,   516,
     517,   520,   521,   522,   523,   524,   525,   530,   531,   532,
     533,   534,   535,   541,   544,   549,   550,   551,   555,   556,
     560,   561,   564,   565,   566,   568,   571
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 1
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "PACKAGE", "IMPORT", "FUNC", "BREAK",
  "CASE", "CONST", "CONTINUE", "DEFAULT", "ELSE", "FOR", "GO", "IF",
  "RANGE", "RETURN", "STRUCT", "SWITCH", "TYPE", "VAR", "VAR_TYPE",
  "BOOL_CONST", "NIL_VAL", "IDENTIFIER", "BYTE", "STRING", "ELLIPSIS",
  "SHL", "SHR", "INC", "DEC", "INTEGER", "FLOAT", "ADD", "SUB", "MUL",
  "QUO", "REM", "ASSIGN", "AND", "NOT", "DEFINE", "AND_NOT", "OR", "XOR",
  "ARROW", "ADD_ASSIGN", "SUB_ASSIGN", "MUL_ASSIGN", "QUO_ASSIGN",
  "REM_ASSIGN", "AND_ASSIGN", "OR_ASSIGN", "XOR_ASSIGN", "SHL_ASSIGN",
  "SHR_ASSIGN", "AND_NOT_ASSIGN", "COLON", "LAND", "LOR", "EQL", "NEQ",
  "LEQ", "GEQ", "SEMICOLON", "GTR", "LSS", "LPAREN", "RPAREN", "LBRACE",
  "RBRACE", "LBRACK", "RBRACK", "COMMA", "PERIOD", "$accept", "StartFile",
  "Block", "OPENB", "CLOSEB", "StatementList", "Statement", "SimpleStmt",
  "EmptyStmt", "LabeledStmt", "Label", "IncDecStmt", "Assignment",
  "VarDecl", "VarSpec", "Declaration", "FunctionDecl", "FunctionName",
  "Function", "FunctionBody", "FunctionStmt", "FunctionCall",
  "ArgumentList", "Arguments", "Signature", "Result", "Parameters",
  "ParameterList", "ParameterDecl", "TypeList", "IdentifierList",
  "IdentifierLIST", "MethodDecl", "Receiver", "TopLevelDeclList",
  "TopLevelDecl", "TypeLit", "Type", "Operand", "OperandName",
  "ReturnStmt", "BreakStmt", "ContinueStmt", "IfStmt", "ForStmt",
  "Condition", "ForClause", "InitStmt", "PostStmt", "int_lit", "float_lit",
  "TypeName", "ArrayType", "ArrayLength", "StructType", "FieldDeclList",
  "FieldDecl", "Tag", "PointerType", "BaseType", "FunctionType",
  "ConstDecl", "ConstSpec", "ExpressionList", "TypeDecl", "TypeSpecList",
  "TypeSpec", "AliasDecl", "TypeDef", "Literal", "string_lit", "byte_lit",
  "BasicLit", "FunctionLit", "PrimaryExpr", "StructLiteral", "KeyValList",
  "Selector", "Index", "TypeAssertion", "Expression", "Expression1",
  "Expression2", "Expression3", "Expression4", "Expression5", "UnaryExpr",
  "rel_op", "add_op", "mul_op", "unary_op", "assign_op", "PackageClause",
  "PackageName", "ImportDeclList", "ImportDecl", "ImportSpecList",
  "ImportSpec", "ImportPath", "PackageName2", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330
};
# endif

#define YYPACT_NINF (-242)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-98)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
      27,    -9,    42,    24,  -242,  -242,  -242,   107,   -13,   220,
    -242,  -242,    -5,   104,  -242,    69,   104,    -2,   114,    13,
     120,  -242,  -242,  -242,  -242,    85,  -242,  -242,  -242,  -242,
      18,   100,  -242,  -242,  -242,  -242,  -242,    36,  -242,  -242,
     149,    11,  -242,     2,   163,  -242,  -242,  -242,   119,  -242,
      11,   239,  -242,   129,  -242,    11,  -242,    73,  -242,    12,
     131,   131,   131,   132,  -242,  -242,    11,   247,  -242,   180,
    -242,  -242,  -242,  -242,  -242,    11,  -242,    30,   161,   203,
     168,   207,  -242,  -242,  -242,  -242,    58,    11,  -242,  -242,
     181,    35,  -242,   181,  -242,   -14,  -242,  -242,   131,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,  -242,   247,
    -242,   186,  -242,  -242,   177,  -242,  -242,  -242,  -242,  -242,
      96,  -242,   197,   201,   250,   172,   265,  -242,    93,   247,
    -242,  -242,   202,  -242,  -242,   242,   247,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,    11,  -242,  -242,  -242,    11,
      -4,   210,  -242,   181,   199,   247,  -242,    11,   247,    29,
    -242,  -242,  -242,   247,   247,  -242,  -242,  -242,  -242,  -242,
    -242,   247,  -242,  -242,  -242,  -242,   247,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,    93,    96,  -242,  -242,  -242,   204,
    -242,   229,    79,  -242,   251,  -242,   211,  -242,  -242,    83,
     226,  -242,   212,  -242,    11,   201,   250,   172,   265,    96,
     247,   262,   262,  -242,  -242,   247,   -15,  -242,   150,   224,
    -242,  -242,  -242,   232,  -242,  -242,   254,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,   162,   223,    91,  -242,    11,
    -242,  -242,  -242,  -242,   247,   247,  -242,   231,  -242,  -242,
    -242,  -242,   247,   247,  -242,    93,   233,   241,  -242,   229,
      93,  -242,  -242,  -242,  -242,  -242,  -242,   247,    93,  -242,
    -242,  -242,   249,  -242,  -242,  -242,   181,   181,   244,    71,
     245,    82,  -242,   223,  -242,  -242,  -242,  -242,   204,  -242,
      98,  -242,   223,   247,  -242,  -242,   247,   247,   307,  -242,
      93,  -242,  -242,  -242,   255,  -242,   181,    -6,  -242,  -242,
     247,   308,  -242,  -242,  -242,  -242,    -6,  -242,  -242,  -242,
    -242,  -242,  -242,  -242
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,   194,   193,     1,   197,     0,     0,
     196,   132,     0,     0,   206,     0,   204,     0,     0,     0,
       0,    33,    70,    71,    72,     2,    69,    31,    32,   195,
       0,     0,   205,   202,   198,   203,    36,     0,     4,    67,
       0,     0,   117,     0,     0,   122,   126,   127,    62,    28,
       0,     0,   199,     0,   201,     0,    51,     0,    54,     0,
       0,     0,     0,     0,   104,   103,     0,     0,    78,   119,
      77,    73,    74,    75,    76,     0,   129,     0,     0,     0,
      61,    30,    68,   200,    58,    52,     0,     0,    56,     5,
       5,    47,    65,    66,   116,     0,   115,   114,     0,    82,
     133,   101,   102,   181,   182,   185,   186,   183,   184,     0,
     139,    80,   134,   135,     0,    79,   136,   137,   130,   131,
     162,   106,   151,   153,   155,   157,   159,   161,     0,     0,
     128,   123,     0,   125,    64,     0,     0,    53,    55,    57,
      34,     4,    38,    35,    37,     0,    48,    50,   108,     0,
       0,     0,   138,     0,     0,   145,   143,     0,     0,     0,
     140,   141,   142,     0,     0,   164,   165,   167,   169,   168,
     166,     0,   170,   171,   172,   173,     0,   177,   178,   174,
     175,   176,   179,   180,     0,   163,   118,   124,    63,    29,
     121,    22,     0,    60,   111,   107,     0,   109,    81,     0,
       0,   105,     0,   148,     0,   152,   154,   156,   158,   160,
       0,    86,    88,     4,     4,    84,    82,    14,     5,     0,
      10,    19,     9,     0,    20,    21,    33,     8,    18,    17,
      11,    12,    13,    15,    16,     0,   162,   121,    49,     0,
     113,   112,   110,   144,     0,     0,   149,     0,   120,    24,
      85,    87,    22,    22,    83,     0,     0,     0,     7,    22,
       0,   187,   188,   189,   190,   191,   192,     0,    44,    25,
      26,    59,     0,   146,   150,    99,     0,     0,     0,   121,
       0,   121,    40,     0,     3,     6,    23,    39,    27,    46,
       0,    43,    45,     0,     5,     5,     0,     0,     5,    41,
       0,   147,    95,    96,     0,    97,     0,     0,    89,    42,
      22,     5,     5,     5,   100,    98,     0,    90,    94,    93,
       5,     5,    92,    91
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -242,  -242,  -167,  -135,   -90,  -242,  -169,  -241,  -242,  -242,
     -33,  -242,  -242,    22,  -242,    49,  -242,  -242,    45,  -242,
    -242,  -180,  -242,    21,    62,  -242,   305,  -242,   237,  -242,
     -19,  -242,  -242,  -242,  -242,   273,  -242,   -41,  -242,  -242,
    -242,  -242,  -242,  -230,  -242,    31,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,  -242,   175,  -242,  -242,  -242,
    -242,  -242,  -242,  -132,  -242,  -242,    52,  -242,  -242,  -242,
     184,  -242,  -242,  -242,  -123,  -242,  -242,  -242,  -242,  -242,
     -64,  -242,   165,   166,   155,   153,  -242,  -242,  -242,  -242,
    -242,  -242,  -242,  -242,  -242,   322,  -242,   103,   316,  -242
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,   142,    60,   140,   218,   219,   220,   221,   222,
     223,   224,   225,   226,    49,   227,    23,    38,    89,   144,
     228,   229,   290,   291,    90,   146,    91,    57,    58,   192,
      59,    80,    24,    40,    25,    26,    68,    69,   110,   111,
     230,   231,   232,   233,   234,   276,   277,   278,   315,   112,
     113,    70,    71,   114,    72,   150,   151,   241,    73,    97,
      74,    27,    42,   235,    28,    77,    45,    46,    47,   115,
     116,   117,   118,   119,   120,   156,   199,   160,   161,   162,
     237,   122,   123,   124,   125,   126,   127,   171,   176,   184,
     128,   267,     3,     5,     9,    10,    30,    15,    33,    16
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
     143,    50,    76,   121,   189,   185,   191,    62,   214,    81,
      48,   275,   280,    11,    84,     4,    62,    62,    88,    63,
      48,    11,    36,    64,   217,    96,    65,   255,    63,    63,
       1,    21,    64,    64,   130,    65,    65,    43,    66,    87,
      62,    75,     6,   -24,    11,   154,   139,    66,    66,   257,
     147,   217,    63,   203,    43,    12,    64,   148,    22,    65,
      48,   209,    13,    55,   141,   186,    37,   195,   236,   314,
      13,    66,   190,    21,    67,   282,   149,   313,   252,   253,
     287,    44,    48,    67,    67,    55,   321,    52,   289,     7,
     286,   200,   217,    13,   202,   236,    78,   204,    98,   131,
      22,   269,   270,   145,   193,    56,    92,    67,   194,   294,
     295,     8,   269,   270,   298,    31,   201,    99,   100,    11,
     289,   269,   270,    93,    94,   101,   102,   137,   256,   132,
      11,   149,   283,    53,    34,   288,   236,   283,    41,   311,
     312,   -97,    85,   152,    48,   292,   248,    86,   238,   320,
      51,   254,   141,   239,   243,    98,   211,   244,    18,   212,
     153,   109,   213,   247,   214,    54,   215,   299,   158,    19,
      20,   159,   300,    61,   216,   100,    11,   292,   250,   251,
     272,   273,   101,   102,   103,   104,   105,    43,   279,   281,
     106,   107,    14,    79,    83,   108,    14,    32,   271,    37,
      32,   261,    95,   190,   302,   303,   172,   173,   308,   262,
     263,   264,   265,   266,    14,   -22,   174,   175,   109,   129,
     141,   317,   318,   319,     8,    17,   133,   134,    18,   301,
     322,   323,   305,   306,    98,   211,   210,    18,   212,    19,
      20,   213,   135,   214,    17,   215,   136,    18,    19,    20,
     157,   141,    98,   216,   100,    11,   155,   163,    19,    20,
     164,   101,   102,   103,   104,   105,   188,   187,   198,   106,
     107,    99,   100,    11,   108,   197,   242,   240,   210,   101,
     102,   103,   104,   105,   245,   246,   249,   106,   107,   258,
     259,   268,   108,   177,   178,   158,   260,   109,   159,   141,
     274,   179,   180,   181,   284,   182,   285,   293,   183,   296,
     297,   165,   166,   167,   168,   109,   169,   170,   307,   316,
     310,   309,    39,   138,    82,   196,   207,   304,   205,   208,
     206,    29,    35
};

static const yytype_int16 yycheck[] =
{
      90,    20,    43,    67,   136,   128,   141,     5,    14,    50,
      24,   252,   253,    26,    55,    24,     5,     5,    59,    17,
      24,    26,    24,    21,   191,    66,    24,    42,    17,    17,
       3,     9,    21,    21,    75,    24,    24,    24,    36,    27,
       5,    39,     0,    58,    26,   109,    87,    36,    36,   218,
      91,   218,    17,    24,    24,    68,    21,    71,     9,    24,
      24,   184,    75,    27,    70,   129,    68,    71,   191,   310,
      75,    36,   136,    51,    72,   255,    95,   307,   213,   214,
     260,    68,    24,    72,    72,    27,   316,    69,   268,    65,
     259,   155,   259,    75,   158,   218,    44,    68,     5,    69,
      51,    30,    31,    68,   145,    69,    61,    72,   149,   276,
     277,     4,    30,    31,   281,    12,   157,    24,    25,    26,
     300,    30,    31,    61,    62,    32,    33,    69,   218,    77,
      26,   150,   255,    30,    65,   267,   259,   260,    24,   306,
     307,    70,    69,    98,    24,   268,   210,    74,    69,   316,
      65,   215,    70,    74,    71,     5,     6,    74,     8,     9,
      98,    68,    12,   204,    14,    65,    16,    69,    72,    19,
      20,    75,    74,    24,    24,    25,    26,   300,   211,   212,
     244,   245,    32,    33,    34,    35,    36,    24,   252,   253,
      40,    41,     8,    74,    65,    45,    12,    13,   239,    68,
      16,    39,    70,   267,   294,   295,    34,    35,   298,    47,
      48,    49,    50,    51,    30,    65,    44,    45,    68,    39,
      70,   311,   312,   313,     4,     5,    65,    24,     8,   293,
     320,   321,   296,   297,     5,     6,    74,     8,     9,    19,
      20,    12,    74,    14,     5,    16,    39,     8,    19,    20,
      73,    70,     5,    24,    25,    26,    70,    60,    19,    20,
      59,    32,    33,    34,    35,    36,    24,    65,    69,    40,
      41,    24,    25,    26,    45,    65,    65,    26,    74,    32,
      33,    34,    35,    36,    58,    73,    24,    40,    41,    65,
      58,    68,    45,    28,    29,    72,    42,    68,    75,    70,
      69,    36,    37,    38,    71,    40,    65,    58,    43,    65,
      65,    61,    62,    63,    64,    68,    66,    67,    11,    11,
      65,   300,    17,    86,    51,   150,   171,   296,   163,   176,
     164,     9,    16
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,    77,   168,    24,   169,     0,    65,     4,   170,
     171,    26,    68,    75,   146,   173,   175,     5,     8,    19,
      20,    89,    91,    92,   108,   110,   111,   137,   140,   171,
     172,   173,   146,   174,    65,   174,    24,    68,    93,   102,
     109,    24,   138,    24,    68,   142,   143,   144,    24,    90,
     106,    65,    69,   173,    65,    27,    69,   103,   104,   106,
      79,    24,     5,    17,    21,    24,    36,    72,   112,   113,
     127,   128,   130,   134,   136,    39,   113,   141,   142,    74,
     107,   113,   111,    65,   113,    69,    74,    27,   113,    94,
     100,   102,    94,   100,   100,    70,   113,   135,     5,    24,
      25,    32,    33,    34,    35,    36,    40,    41,    45,    68,
     114,   115,   125,   126,   129,   145,   146,   147,   148,   149,
     150,   156,   157,   158,   159,   160,   161,   162,   166,    39,
     113,    69,   142,    65,    24,    74,    39,    69,   104,   113,
      80,    70,    78,    80,    95,    68,   101,   113,    71,   106,
     131,   132,    94,   100,   156,    70,   151,    73,    72,    75,
     153,   154,   155,    60,    59,    61,    62,    63,    64,    66,
      67,   163,    34,    35,    44,    45,   164,    28,    29,    36,
      37,    38,    40,    43,   165,   150,   156,    65,    24,   139,
     156,    79,   105,   113,   113,    71,   132,    65,    69,   152,
     156,   113,   156,    24,    68,   158,   159,   160,   161,   150,
      74,     6,     9,    12,    14,    16,    24,    78,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    91,    96,    97,
     116,   117,   118,   119,   120,   139,   150,   156,    69,    74,
      26,   133,    65,    71,    74,    58,    73,   113,   156,    24,
      86,    86,    79,    79,   156,    42,    80,    82,    65,    58,
      42,    39,    47,    48,    49,    50,    51,   167,    68,    30,
      31,   113,   156,   156,    69,    83,   121,   122,   123,   156,
      83,   156,    97,   150,    71,    65,    82,    97,   139,    97,
      98,    99,   150,    58,    78,    78,    65,    65,    78,    69,
      74,   156,    80,    80,   121,   156,   156,    11,    80,    99,
      65,    78,    78,   119,    83,   124,    11,    80,    80,    80,
      78,   119,    80,    80
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    76,    77,    78,    79,    80,    81,    81,    82,    82,
      82,    82,    82,    82,    82,    82,    82,    82,    82,    83,
      83,    83,    84,    85,    86,    87,    87,    88,    89,    90,
      90,    91,    91,    91,    92,    92,    93,    94,    95,    96,
      96,    97,    98,    98,    98,    99,    99,   100,   100,   101,
     101,   102,   102,   102,   103,   103,   104,   104,   104,   105,
     105,   106,   106,   107,   107,   108,   108,   109,   110,   110,
     111,   111,   111,   112,   112,   112,   112,   113,   113,   114,
     114,   114,   115,   116,   116,   117,   117,   118,   118,   119,
     119,   119,   119,   119,   119,   120,   120,   121,   122,   123,
     124,   125,   126,   127,   127,   128,   129,   130,   130,   131,
     131,   132,   132,   133,   134,   135,   136,   137,   138,   138,
     139,   139,   140,   140,   141,   141,   142,   142,   143,   144,
     145,   145,   146,   147,   148,   148,   148,   148,   149,   150,
     150,   150,   150,   150,   151,   152,   152,   152,   153,   154,
     155,   156,   157,   157,   158,   158,   159,   159,   160,   160,
     161,   161,   162,   162,   163,   163,   163,   163,   163,   163,
     164,   164,   164,   164,   165,   165,   165,   165,   165,   165,
     165,   166,   166,   166,   166,   166,   166,   167,   167,   167,
     167,   167,   167,   168,   169,   170,   170,   170,   171,   171,
     172,   172,   173,   173,   173,   174,   175
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     4,     5,     0,     0,     3,     2,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     0,     3,     1,     2,     2,     3,     2,     4,
       2,     1,     1,     1,     5,     5,     1,     2,     1,     3,
       3,     4,     3,     1,     0,     1,     1,     1,     2,     3,
       1,     2,     3,     4,     1,     3,     2,     3,     2,     3,
       1,     2,     1,     3,     2,     4,     4,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     2,     1,     2,     1,     2,     1,     5,
       7,     9,     9,     7,     7,     5,     5,     1,     5,     1,
       1,     1,     1,     1,     1,     4,     1,     4,     3,     2,
       3,     2,     3,     1,     2,     1,     2,     2,     4,     2,
       3,     1,     2,     4,     3,     2,     1,     1,     3,     2,
       1,     1,     1,     1,     1,     1,     1,     1,     2,     1,
       2,     2,     2,     2,     3,     0,     3,     5,     2,     3,
       4,     1,     3,     1,     3,     1,     3,     1,     3,     1,
       3,     1,     1,     2,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     1,     2,     1,     0,     3,     4,
       3,     2,     2,     2,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            else
              goto append;

          append:
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2:
#line 70 "src/yacc.y"
                                                            {
		printf("Parsed Start of program file.");
    	lhs.push_back("StartFile");rhs.push_back("PackageClause SEMICOLON ImportDeclList TopLevelDeclList");//cout << "---" << $$ << "---" << $3 << "---";
    }
#line 1743 "y.tab.c"
    break;

  case 3:
#line 77 "src/yacc.y"
                                                {lhs.push_back("Block");rhs.push_back("LBRACE OPENB StatementList CLOSEB RBRACE");}
#line 1749 "y.tab.c"
    break;

  case 4:
#line 83 "src/yacc.y"
                 {lhs.push_back("OPENB");rhs.push_back("/*empty*/");}
#line 1755 "y.tab.c"
    break;

  case 5:
#line 87 "src/yacc.y"
                 {lhs.push_back("CLOSEB");rhs.push_back("/*empty*/");}
#line 1761 "y.tab.c"
    break;

  case 6:
#line 91 "src/yacc.y"
                                      {lhs.push_back("StatementList");rhs.push_back("StatementList Statement SEMICOLON");}
#line 1767 "y.tab.c"
    break;

  case 7:
#line 92 "src/yacc.y"
                          {lhs.push_back("StatementList");rhs.push_back("Statement SEMICOLON");/*;printf("got a statement");*/}
#line 1773 "y.tab.c"
    break;

  case 8:
#line 96 "src/yacc.y"
                    {lhs.push_back("Statement");rhs.push_back("Declaration");}
#line 1779 "y.tab.c"
    break;

  case 9:
#line 97 "src/yacc.y"
                      {lhs.push_back("Statement");rhs.push_back("LabeledStmt");}
#line 1785 "y.tab.c"
    break;

  case 10:
#line 98 "src/yacc.y"
                     {lhs.push_back("Statement");rhs.push_back("SimpleStmt");}
#line 1791 "y.tab.c"
    break;

  case 11:
#line 99 "src/yacc.y"
                    {lhs.push_back("Statement");rhs.push_back("ReturnStmt");}
#line 1797 "y.tab.c"
    break;

  case 12:
#line 100 "src/yacc.y"
                    {lhs.push_back("Statement");rhs.push_back("BreakStmt");}
#line 1803 "y.tab.c"
    break;

  case 13:
#line 101 "src/yacc.y"
                       {lhs.push_back("Statement");rhs.push_back("ContinueStmt");}
#line 1809 "y.tab.c"
    break;

  case 14:
#line 102 "src/yacc.y"
               {lhs.push_back("Statement");rhs.push_back("Block");}
#line 1815 "y.tab.c"
    break;

  case 15:
#line 103 "src/yacc.y"
                 {lhs.push_back("Statement");rhs.push_back("IfStmt");}
#line 1821 "y.tab.c"
    break;

  case 16:
#line 104 "src/yacc.y"
                   {lhs.push_back("Statement");rhs.push_back("ForStmt");}
#line 1827 "y.tab.c"
    break;

  case 17:
#line 105 "src/yacc.y"
                       {lhs.push_back("Statement");rhs.push_back("FunctionCall");}
#line 1833 "y.tab.c"
    break;

  case 18:
#line 106 "src/yacc.y"
                       {lhs.push_back("Statement");rhs.push_back("FunctionStmt");}
#line 1839 "y.tab.c"
    break;

  case 19:
#line 109 "src/yacc.y"
                  {lhs.push_back("SimpleStmt");rhs.push_back("EmptyStmt");}
#line 1845 "y.tab.c"
    break;

  case 20:
#line 110 "src/yacc.y"
                      {lhs.push_back("SimpleStmt");rhs.push_back("IncDecStmt");}
#line 1851 "y.tab.c"
    break;

  case 21:
#line 111 "src/yacc.y"
                     {lhs.push_back("SimpleStmt");rhs.push_back("Assignment");}
#line 1857 "y.tab.c"
    break;

  case 22:
#line 115 "src/yacc.y"
                 {lhs.push_back("EmptyStmt");rhs.push_back("/*empty*/");}
#line 1863 "y.tab.c"
    break;

  case 23:
#line 121 "src/yacc.y"
                              {lhs.push_back("LabeledStmt");rhs.push_back("Label COLON Statement");}
#line 1869 "y.tab.c"
    break;

  case 24:
#line 123 "src/yacc.y"
                   {lhs.push_back("Label");rhs.push_back("IDENTIFIER");}
#line 1875 "y.tab.c"
    break;

  case 25:
#line 128 "src/yacc.y"
                       {lhs.push_back("IncDecStmt");rhs.push_back("Expression INC");}
#line 1881 "y.tab.c"
    break;

  case 26:
#line 129 "src/yacc.y"
                        {lhs.push_back("IncDecStmt");rhs.push_back("Expression DEC");}
#line 1887 "y.tab.c"
    break;

  case 27:
#line 132 "src/yacc.y"
                                                {lhs.push_back("Assignment");rhs.push_back("ExpressionList assign_op ExpressionList");}
#line 1893 "y.tab.c"
    break;

  case 28:
#line 136 "src/yacc.y"
                            {lhs.push_back("VarDecl");rhs.push_back("VAR VarSpec");}
#line 1899 "y.tab.c"
    break;

  case 29:
#line 139 "src/yacc.y"
                                                          {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type ASSIGN ExpressionList");}
#line 1905 "y.tab.c"
    break;

  case 30:
#line 140 "src/yacc.y"
                                      {lhs.push_back("VarSpec");rhs.push_back("IdentifierList Type");}
#line 1911 "y.tab.c"
    break;

  case 31:
#line 145 "src/yacc.y"
                  {lhs.push_back("Declaration");rhs.push_back("ConstDecl");}
#line 1917 "y.tab.c"
    break;

  case 32:
#line 146 "src/yacc.y"
                   {lhs.push_back("Declaration");rhs.push_back("TypeDecl");}
#line 1923 "y.tab.c"
    break;

  case 33:
#line 147 "src/yacc.y"
                  {lhs.push_back("Declaration");rhs.push_back("VarDecl");}
#line 1929 "y.tab.c"
    break;

  case 34:
#line 151 "src/yacc.y"
                                                        {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Function CLOSEB");}
#line 1935 "y.tab.c"
    break;

  case 35:
#line 152 "src/yacc.y"
                                                          {lhs.push_back("FunctionDecl");rhs.push_back("FUNC FunctionName OPENB Signature CLOSEB");}
#line 1941 "y.tab.c"
    break;

  case 36:
#line 154 "src/yacc.y"
                           {lhs.push_back("FunctionName");rhs.push_back("IDENTIFIER");}
#line 1947 "y.tab.c"
    break;

  case 37:
#line 156 "src/yacc.y"
                                       {lhs.push_back("Function");rhs.push_back("Signature FunctionBody");}
#line 1953 "y.tab.c"
    break;

  case 38:
#line 158 "src/yacc.y"
                      {lhs.push_back("FunctionBody");rhs.push_back("Block");}
#line 1959 "y.tab.c"
    break;

  case 39:
#line 162 "src/yacc.y"
                                           {lhs.push_back("FunctionStmt");rhs.push_back("VarDecl DEFINE FunctionCall");}
#line 1965 "y.tab.c"
    break;

  case 40:
#line 164 "src/yacc.y"
                                                {lhs.push_back("FunctionStmt");rhs.push_back("IDENTIFIER DEFINE FunctionCall");}
#line 1971 "y.tab.c"
    break;

  case 41:
#line 168 "src/yacc.y"
                                                       {lhs.push_back("FunctionCall");rhs.push_back("PrimaryExpr LPAREN ArgumentList RPAREN");}
#line 1977 "y.tab.c"
    break;

  case 42:
#line 172 "src/yacc.y"
                                             {lhs.push_back("ArgumentList");rhs.push_back("ArgumentList COMMA Arguments");}
#line 1983 "y.tab.c"
    break;

  case 43:
#line 173 "src/yacc.y"
                            {lhs.push_back("ArgumentList");rhs.push_back("Arguments");}
#line 1989 "y.tab.c"
    break;

  case 44:
#line 174 "src/yacc.y"
                           {lhs.push_back("ArgumentList");rhs.push_back("/*empty*/");}
#line 1995 "y.tab.c"
    break;

  case 45:
#line 177 "src/yacc.y"
                            {lhs.push_back("Arguments");rhs.push_back("PrimaryExpr");}
#line 2001 "y.tab.c"
    break;

  case 46:
#line 178 "src/yacc.y"
                               {lhs.push_back("Arguments");rhs.push_back("FunctionCall");}
#line 2007 "y.tab.c"
    break;

  case 47:
#line 184 "src/yacc.y"
                   {lhs.push_back("Signature");rhs.push_back("Parameters");}
#line 2013 "y.tab.c"
    break;

  case 48:
#line 185 "src/yacc.y"
                           {lhs.push_back("Signature");rhs.push_back("Parameters Result");}
#line 2019 "y.tab.c"
    break;

  case 49:
#line 189 "src/yacc.y"
                               {lhs.push_back("Result");rhs.push_back("LPAREN TypeList RPAREN");}
#line 2025 "y.tab.c"
    break;

  case 50:
#line 190 "src/yacc.y"
                {lhs.push_back("Result");rhs.push_back("Type");}
#line 2031 "y.tab.c"
    break;

  case 51:
#line 193 "src/yacc.y"
                      { lhs.push_back("Parameters");rhs.push_back("LPAREN RPAREN");}
#line 2037 "y.tab.c"
    break;

  case 52:
#line 194 "src/yacc.y"
                                      {lhs.push_back("Parameters");rhs.push_back("LPAREN ParameterList RPAREN");}
#line 2043 "y.tab.c"
    break;

  case 53:
#line 195 "src/yacc.y"
                                           {lhs.push_back("Parameters");rhs.push_back("LPAREN ParameterList COMMA RPAREN");}
#line 2049 "y.tab.c"
    break;

  case 54:
#line 198 "src/yacc.y"
                      {lhs.push_back("ParameterList");rhs.push_back("ParameterDecl");}
#line 2055 "y.tab.c"
    break;

  case 55:
#line 199 "src/yacc.y"
                                           {lhs.push_back("ParameterList");rhs.push_back("ParameterList COMMA ParameterDecl");}
#line 2061 "y.tab.c"
    break;

  case 56:
#line 205 "src/yacc.y"
                            {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList Type");}
#line 2067 "y.tab.c"
    break;

  case 57:
#line 206 "src/yacc.y"
                                        {lhs.push_back("ParameterDecl");rhs.push_back("IdentifierList ELLIPSIS  Type");}
#line 2073 "y.tab.c"
    break;

  case 58:
#line 207 "src/yacc.y"
                       {lhs.push_back("ParameterDecl");rhs.push_back("ELLIPSIS Type");}
#line 2079 "y.tab.c"
    break;

  case 59:
#line 211 "src/yacc.y"
                        {lhs.push_back("TypeList");rhs.push_back("TypeList COMMA Type");}
#line 2085 "y.tab.c"
    break;

  case 60:
#line 212 "src/yacc.y"
           {lhs.push_back("TypeList");rhs.push_back("Type");}
#line 2091 "y.tab.c"
    break;

  case 61:
#line 218 "src/yacc.y"
                                          {lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER IdentifierLIST");}
#line 2097 "y.tab.c"
    break;

  case 62:
#line 219 "src/yacc.y"
                             {lhs.push_back("IdentifierList");rhs.push_back("IDENTIFIER");}
#line 2103 "y.tab.c"
    break;

  case 63:
#line 222 "src/yacc.y"
                                                {lhs.push_back("IdentifierLIST");rhs.push_back("IdentifierLIST COMMA IDENTIFIER");}
#line 2109 "y.tab.c"
    break;

  case 64:
#line 223 "src/yacc.y"
                                   {lhs.push_back("IdentifierLIST");rhs.push_back("COMMA IDENTIFIER");}
#line 2115 "y.tab.c"
    break;

  case 65:
#line 228 "src/yacc.y"
                                          {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Function");}
#line 2121 "y.tab.c"
    break;

  case 66:
#line 229 "src/yacc.y"
                                             {lhs.push_back("MethodDecl");rhs.push_back("FUNC Receiver IDENTIFIER Signature");}
#line 2127 "y.tab.c"
    break;

  case 67:
#line 233 "src/yacc.y"
                   {lhs.push_back("Receiver");rhs.push_back("Parameters");}
#line 2133 "y.tab.c"
    break;

  case 68:
#line 236 "src/yacc.y"
                                                            {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDeclList SEMICOLON  TopLevelDecl");}
#line 2139 "y.tab.c"
    break;

  case 69:
#line 237 "src/yacc.y"
                    {lhs.push_back("TopLevelDeclList");rhs.push_back("TopLevelDecl");}
#line 2145 "y.tab.c"
    break;

  case 70:
#line 241 "src/yacc.y"
                    {lhs.push_back("TopLevelDecl");rhs.push_back("Declaration");}
#line 2151 "y.tab.c"
    break;

  case 71:
#line 242 "src/yacc.y"
                       {lhs.push_back("TopLevelDecl");rhs.push_back("FunctionDecl");}
#line 2157 "y.tab.c"
    break;

  case 72:
#line 243 "src/yacc.y"
                     {lhs.push_back("TopLevelDecl");rhs.push_back("MethodDecl");}
#line 2163 "y.tab.c"
    break;

  case 73:
#line 247 "src/yacc.y"
                  {lhs.push_back("TypeLit");rhs.push_back("ArrayType");}
#line 2169 "y.tab.c"
    break;

  case 74:
#line 248 "src/yacc.y"
                     {lhs.push_back("TypeLit");rhs.push_back("StructType");}
#line 2175 "y.tab.c"
    break;

  case 75:
#line 249 "src/yacc.y"
                      {lhs.push_back("TypeLit");rhs.push_back("PointerType");}
#line 2181 "y.tab.c"
    break;

  case 76:
#line 250 "src/yacc.y"
                       {lhs.push_back("TypeLit");rhs.push_back("FunctionType");}
#line 2187 "y.tab.c"
    break;

  case 77:
#line 257 "src/yacc.y"
                 {lhs.push_back("Type");rhs.push_back("TypeName");}
#line 2193 "y.tab.c"
    break;

  case 78:
#line 258 "src/yacc.y"
                  {lhs.push_back("Type");rhs.push_back("TypeLit");}
#line 2199 "y.tab.c"
    break;

  case 79:
#line 262 "src/yacc.y"
                {lhs.push_back("Operand");rhs.push_back("Literal");}
#line 2205 "y.tab.c"
    break;

  case 80:
#line 263 "src/yacc.y"
                      {lhs.push_back("Operand");rhs.push_back("OperandName");}
#line 2211 "y.tab.c"
    break;

  case 81:
#line 264 "src/yacc.y"
                                   {lhs.push_back("Operand");rhs.push_back("LPAREN Expression RPAREN");}
#line 2217 "y.tab.c"
    break;

  case 82:
#line 267 "src/yacc.y"
                   {lhs.push_back("OperandName");rhs.push_back("IDENTIFIER");}
#line 2223 "y.tab.c"
    break;

  case 83:
#line 271 "src/yacc.y"
                          {lhs.push_back("ReturnStmt");rhs.push_back("RETURN Expression");}
#line 2229 "y.tab.c"
    break;

  case 84:
#line 272 "src/yacc.y"
                {lhs.push_back("ReturnStmt");rhs.push_back("RETURN");}
#line 2235 "y.tab.c"
    break;

  case 85:
#line 275 "src/yacc.y"
                    {lhs.push_back("BreakStmt");rhs.push_back("BREAK Label");}
#line 2241 "y.tab.c"
    break;

  case 86:
#line 276 "src/yacc.y"
                {lhs.push_back("BreakStmt");rhs.push_back("BREAK");}
#line 2247 "y.tab.c"
    break;

  case 87:
#line 279 "src/yacc.y"
                       {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE Label");}
#line 2253 "y.tab.c"
    break;

  case 88:
#line 280 "src/yacc.y"
                  {lhs.push_back("ContinueStmt");rhs.push_back("CONTINUE");}
#line 2259 "y.tab.c"
    break;

  case 89:
#line 284 "src/yacc.y"
                                         {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block CLOSEB");}
#line 2265 "y.tab.c"
    break;

  case 90:
#line 285 "src/yacc.y"
                                                               {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block CLOSEB");}
#line 2271 "y.tab.c"
    break;

  case 91:
#line 286 "src/yacc.y"
                                                                            {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE IfStmt CLOSEB");}
#line 2277 "y.tab.c"
    break;

  case 92:
#line 287 "src/yacc.y"
                                                                           {lhs.push_back("IfStmt");rhs.push_back("IF OPENB SimpleStmt SEMICOLON Expression Block ELSE  Block CLOSEB");}
#line 2283 "y.tab.c"
    break;

  case 93:
#line 288 "src/yacc.y"
                                                      {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE IfStmt CLOSEB");}
#line 2289 "y.tab.c"
    break;

  case 94:
#line 289 "src/yacc.y"
                                                      {lhs.push_back("IfStmt");rhs.push_back("IF OPENB Expression Block ELSE  Block CLOSEB");}
#line 2295 "y.tab.c"
    break;

  case 95:
#line 293 "src/yacc.y"
                                         {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB Condition Block CLOSEB");}
#line 2301 "y.tab.c"
    break;

  case 96:
#line 294 "src/yacc.y"
                                          {lhs.push_back("ForStmt");rhs.push_back("FOR OPENB ForClause Block CLOSEB");}
#line 2307 "y.tab.c"
    break;

  case 97:
#line 297 "src/yacc.y"
                   {lhs.push_back("Condition");rhs.push_back("Expression");}
#line 2313 "y.tab.c"
    break;

  case 98:
#line 300 "src/yacc.y"
                                                        {lhs.push_back("ForClause");rhs.push_back("InitStmt SEMICOLON Condition SEMICOLON PostStmt");}
#line 2319 "y.tab.c"
    break;

  case 99:
#line 303 "src/yacc.y"
                   {lhs.push_back("InitStmt");rhs.push_back("SimpleStmt");}
#line 2325 "y.tab.c"
    break;

  case 100:
#line 305 "src/yacc.y"
                   {lhs.push_back("PostStmt");rhs.push_back("SimpleStmt");}
#line 2331 "y.tab.c"
    break;

  case 101:
#line 308 "src/yacc.y"
               {lhs.push_back("int_lit");rhs.push_back("INTEGER");}
#line 2337 "y.tab.c"
    break;

  case 102:
#line 311 "src/yacc.y"
               {lhs.push_back("float_lit");rhs.push_back("FLOAT");}
#line 2343 "y.tab.c"
    break;

  case 103:
#line 317 "src/yacc.y"
                   {lhs.push_back("TypeName");rhs.push_back("IDENTIFIER");}
#line 2349 "y.tab.c"
    break;

  case 104:
#line 318 "src/yacc.y"
                   {lhs.push_back("TypeName");rhs.push_back("VAR_TYPE");}
#line 2355 "y.tab.c"
    break;

  case 105:
#line 324 "src/yacc.y"
                                      {lhs.push_back("ArrayType");rhs.push_back("LBRACK ArrayLength RBRACK Type");}
#line 2361 "y.tab.c"
    break;

  case 106:
#line 328 "src/yacc.y"
                  {lhs.push_back("ArrayLength");rhs.push_back("Expression");}
#line 2367 "y.tab.c"
    break;

  case 107:
#line 332 "src/yacc.y"
                                       {lhs.push_back("StructType");rhs.push_back("STRUCT LBRACE FieldDeclList RBRACE");}
#line 2373 "y.tab.c"
    break;

  case 108:
#line 333 "src/yacc.y"
                           {lhs.push_back("StructType");rhs.push_back("STRUCT LBRACE RBRACE");}
#line 2379 "y.tab.c"
    break;

  case 109:
#line 337 "src/yacc.y"
                        {lhs.push_back("FieldDeclList");rhs.push_back("FieldDecl SEMICOLON");}
#line 2385 "y.tab.c"
    break;

  case 110:
#line 338 "src/yacc.y"
                                        {lhs.push_back("FieldDeclList");rhs.push_back("FieldDeclList FieldDecl SEMICOLON");}
#line 2391 "y.tab.c"
    break;

  case 111:
#line 342 "src/yacc.y"
                            {lhs.push_back("FieldDecl");rhs.push_back("IdentifierList Type");}
#line 2397 "y.tab.c"
    break;

  case 112:
#line 343 "src/yacc.y"
                                  {lhs.push_back("FieldDecl");rhs.push_back("IdentifierList Type Tag");}
#line 2403 "y.tab.c"
    break;

  case 113:
#line 347 "src/yacc.y"
               {lhs.push_back("Tag");rhs.push_back("STRING");}
#line 2409 "y.tab.c"
    break;

  case 114:
#line 351 "src/yacc.y"
                     {lhs.push_back("PointerType");rhs.push_back("MUL BaseType");}
#line 2415 "y.tab.c"
    break;

  case 115:
#line 354 "src/yacc.y"
             {lhs.push_back("BaseType");rhs.push_back("Type");}
#line 2421 "y.tab.c"
    break;

  case 116:
#line 358 "src/yacc.y"
                       {lhs.push_back("FunctionType");rhs.push_back("FUNC Signature");}
#line 2427 "y.tab.c"
    break;

  case 117:
#line 362 "src/yacc.y"
                                {lhs.push_back("ConstDecl");rhs.push_back("CONST ConstSpec");}
#line 2433 "y.tab.c"
    break;

  case 118:
#line 366 "src/yacc.y"
                                                  {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type ASSIGN Expression");}
#line 2439 "y.tab.c"
    break;

  case 119:
#line 367 "src/yacc.y"
                                  {lhs.push_back("ConstSpec");rhs.push_back("IDENTIFIER Type");}
#line 2445 "y.tab.c"
    break;

  case 120:
#line 371 "src/yacc.y"
                                                {lhs.push_back("ExpressionList");rhs.push_back("ExpressionList COMMA Expression");}
#line 2451 "y.tab.c"
    break;

  case 121:
#line 372 "src/yacc.y"
                             {lhs.push_back("ExpressionList");rhs.push_back("Expression");}
#line 2457 "y.tab.c"
    break;

  case 122:
#line 376 "src/yacc.y"
                               {lhs.push_back("TypeDecl");rhs.push_back("TYPE  TypeSpec");}
#line 2463 "y.tab.c"
    break;

  case 123:
#line 377 "src/yacc.y"
                                                  {lhs.push_back("TypeDecl");rhs.push_back("TYPE LPAREN TypeSpecList RPAREN");}
#line 2469 "y.tab.c"
    break;

  case 124:
#line 380 "src/yacc.y"
                                                {lhs.push_back("TypeSpecList");rhs.push_back("TypeSpecList TypeSpec SEMICOLON");}
#line 2475 "y.tab.c"
    break;

  case 125:
#line 381 "src/yacc.y"
                                     {lhs.push_back("TypeSpecList");rhs.push_back("TypeSpec SEMICOLON");}
#line 2481 "y.tab.c"
    break;

  case 126:
#line 384 "src/yacc.y"
                          {lhs.push_back("TypeSpec");rhs.push_back("AliasDecl");}
#line 2487 "y.tab.c"
    break;

  case 127:
#line 385 "src/yacc.y"
                          {lhs.push_back("TypeSpec");rhs.push_back("TypeDef");}
#line 2493 "y.tab.c"
    break;

  case 128:
#line 388 "src/yacc.y"
                                       {lhs.push_back("AliasDecl");rhs.push_back("IDENTIFIER ASSIGN Type");}
#line 2499 "y.tab.c"
    break;

  case 129:
#line 392 "src/yacc.y"
                                {lhs.push_back("TypeDef");rhs.push_back("IDENTIFIER Type");}
#line 2505 "y.tab.c"
    break;

  case 130:
#line 399 "src/yacc.y"
                 {lhs.push_back("Literal");rhs.push_back("BasicLit");}
#line 2511 "y.tab.c"
    break;

  case 131:
#line 400 "src/yacc.y"
                      {lhs.push_back("Literal");rhs.push_back("FunctionLit");}
#line 2517 "y.tab.c"
    break;

  case 132:
#line 404 "src/yacc.y"
               {lhs.push_back("string_lit");rhs.push_back("STRING");}
#line 2523 "y.tab.c"
    break;

  case 133:
#line 409 "src/yacc.y"
             {lhs.push_back("byte_lit");rhs.push_back("BYTE");}
#line 2529 "y.tab.c"
    break;

  case 134:
#line 413 "src/yacc.y"
                {lhs.push_back("BasicLit");rhs.push_back("int_lit");}
#line 2535 "y.tab.c"
    break;

  case 135:
#line 414 "src/yacc.y"
                    {lhs.push_back("BasicLit");rhs.push_back("float_lit");}
#line 2541 "y.tab.c"
    break;

  case 136:
#line 415 "src/yacc.y"
                     {lhs.push_back("BasicLit");rhs.push_back("string_lit");}
#line 2547 "y.tab.c"
    break;

  case 137:
#line 416 "src/yacc.y"
                   {lhs.push_back("BasicLit");rhs.push_back("byte_lit");}
#line 2553 "y.tab.c"
    break;

  case 138:
#line 421 "src/yacc.y"
                      {lhs.push_back("FunctionLit");rhs.push_back("FUNC Function");}
#line 2559 "y.tab.c"
    break;

  case 139:
#line 424 "src/yacc.y"
                {lhs.push_back("PrimaryExpr");rhs.push_back("Operand");}
#line 2565 "y.tab.c"
    break;

  case 140:
#line 425 "src/yacc.y"
                             {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Selector");}
#line 2571 "y.tab.c"
    break;

  case 141:
#line 426 "src/yacc.y"
                          {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr Index");}
#line 2577 "y.tab.c"
    break;

  case 142:
#line 427 "src/yacc.y"
                                  {lhs.push_back("PrimaryExpr");rhs.push_back("PrimaryExpr TypeAssertion");}
#line 2583 "y.tab.c"
    break;

  case 143:
#line 428 "src/yacc.y"
                                  {lhs.push_back("PrimaryExpr");rhs.push_back("OperandName StructLiteral");}
#line 2589 "y.tab.c"
    break;

  case 144:
#line 433 "src/yacc.y"
                             {lhs.push_back("StructLiteral");rhs.push_back("LBRACE KeyValList RBRACE");}
#line 2595 "y.tab.c"
    break;

  case 145:
#line 437 "src/yacc.y"
                     {lhs.push_back("KeyValList");rhs.push_back("/* empty */");}
#line 2601 "y.tab.c"
    break;

  case 146:
#line 438 "src/yacc.y"
                                      {lhs.push_back("KeyValList");rhs.push_back("Expression COLON Expression");}
#line 2607 "y.tab.c"
    break;

  case 147:
#line 439 "src/yacc.y"
                                                        {lhs.push_back("KeyValList");rhs.push_back("KeyValList COMMA Expression COLON Expression");}
#line 2613 "y.tab.c"
    break;

  case 148:
#line 444 "src/yacc.y"
                          {lhs.push_back("Selector");rhs.push_back("PERIOD IDENTIFIER");}
#line 2619 "y.tab.c"
    break;

  case 149:
#line 446 "src/yacc.y"
                                 {lhs.push_back("Index");rhs.push_back("LBRACK Expression RBRACK");}
#line 2625 "y.tab.c"
    break;

  case 150:
#line 450 "src/yacc.y"
                                  {lhs.push_back("TypeAssertion");rhs.push_back("PERIOD LPAREN Type RPAREN");}
#line 2631 "y.tab.c"
    break;

  case 151:
#line 454 "src/yacc.y"
                {lhs.push_back("Expression");rhs.push_back("Expression1");}
#line 2637 "y.tab.c"
    break;

  case 152:
#line 458 "src/yacc.y"
                                {lhs.push_back("Expression1");rhs.push_back("Expression1 LOR Expression2");}
#line 2643 "y.tab.c"
    break;

  case 153:
#line 459 "src/yacc.y"
                  {lhs.push_back("Expression1");rhs.push_back("Expression2");}
#line 2649 "y.tab.c"
    break;

  case 154:
#line 463 "src/yacc.y"
                                 {lhs.push_back("Expression2");rhs.push_back("Expression2 LAND Expression3");}
#line 2655 "y.tab.c"
    break;

  case 155:
#line 464 "src/yacc.y"
                  {lhs.push_back("Expression2");rhs.push_back("Expression3");}
#line 2661 "y.tab.c"
    break;

  case 156:
#line 468 "src/yacc.y"
                                   {lhs.push_back("Expression3");rhs.push_back("Expression3 rel_op Expression4");}
#line 2667 "y.tab.c"
    break;

  case 157:
#line 469 "src/yacc.y"
                  {lhs.push_back("Expression3");rhs.push_back("Expression4");}
#line 2673 "y.tab.c"
    break;

  case 158:
#line 473 "src/yacc.y"
                                   {lhs.push_back("Expression4");rhs.push_back("Expression4 add_op Expression5");}
#line 2679 "y.tab.c"
    break;

  case 159:
#line 474 "src/yacc.y"
                  {lhs.push_back("Expression4");rhs.push_back("Expression5");}
#line 2685 "y.tab.c"
    break;

  case 160:
#line 478 "src/yacc.y"
                                   {lhs.push_back("Expression5");rhs.push_back("Expression5 mul_op PrimaryExpr");}
#line 2691 "y.tab.c"
    break;

  case 161:
#line 479 "src/yacc.y"
                {lhs.push_back("Expression5");rhs.push_back("UnaryExpr");}
#line 2697 "y.tab.c"
    break;

  case 162:
#line 485 "src/yacc.y"
                    {lhs.push_back("UnaryExpr");rhs.push_back("PrimaryExpr");}
#line 2703 "y.tab.c"
    break;

  case 163:
#line 486 "src/yacc.y"
                               {lhs.push_back("UnaryExpr");rhs.push_back("unary_op PrimaryExpr");}
#line 2709 "y.tab.c"
    break;

  case 164:
#line 499 "src/yacc.y"
            {lhs.push_back("rel_op");rhs.push_back("EQL");}
#line 2715 "y.tab.c"
    break;

  case 165:
#line 500 "src/yacc.y"
              {lhs.push_back("rel_op");rhs.push_back("NEQ");}
#line 2721 "y.tab.c"
    break;

  case 166:
#line 501 "src/yacc.y"
              {lhs.push_back("rel_op");rhs.push_back("LSS");}
#line 2727 "y.tab.c"
    break;

  case 167:
#line 502 "src/yacc.y"
              {lhs.push_back("rel_op");rhs.push_back("LEQ");}
#line 2733 "y.tab.c"
    break;

  case 168:
#line 503 "src/yacc.y"
              {lhs.push_back("rel_op");rhs.push_back("GTR");}
#line 2739 "y.tab.c"
    break;

  case 169:
#line 504 "src/yacc.y"
              {lhs.push_back("rel_op");rhs.push_back("GEQ");}
#line 2745 "y.tab.c"
    break;

  case 170:
#line 506 "src/yacc.y"
            {lhs.push_back("add_op");rhs.push_back("ADD");}
#line 2751 "y.tab.c"
    break;

  case 171:
#line 507 "src/yacc.y"
              {lhs.push_back("add_op");rhs.push_back("SUB");}
#line 2757 "y.tab.c"
    break;

  case 172:
#line 508 "src/yacc.y"
             {lhs.push_back("add_op");rhs.push_back("OR");}
#line 2763 "y.tab.c"
    break;

  case 173:
#line 509 "src/yacc.y"
              {lhs.push_back("add_op");rhs.push_back("XOR");}
#line 2769 "y.tab.c"
    break;

  case 174:
#line 511 "src/yacc.y"
            {lhs.push_back("mul_op");rhs.push_back("MUL");}
#line 2775 "y.tab.c"
    break;

  case 175:
#line 512 "src/yacc.y"
              {lhs.push_back("mul_op");rhs.push_back("QUO");}
#line 2781 "y.tab.c"
    break;

  case 176:
#line 513 "src/yacc.y"
              {lhs.push_back("mul_op");rhs.push_back("REM");}
#line 2787 "y.tab.c"
    break;

  case 177:
#line 514 "src/yacc.y"
              {lhs.push_back("mul_op");rhs.push_back("SHL");}
#line 2793 "y.tab.c"
    break;

  case 178:
#line 515 "src/yacc.y"
              {lhs.push_back("mul_op");rhs.push_back("SHR");}
#line 2799 "y.tab.c"
    break;

  case 179:
#line 516 "src/yacc.y"
              {lhs.push_back("mul_op");rhs.push_back("AND");}
#line 2805 "y.tab.c"
    break;

  case 180:
#line 517 "src/yacc.y"
                  {lhs.push_back("mul_op");rhs.push_back("AND_NOT");}
#line 2811 "y.tab.c"
    break;

  case 181:
#line 520 "src/yacc.y"
            {lhs.push_back("unary_op");rhs.push_back("ADD");}
#line 2817 "y.tab.c"
    break;

  case 182:
#line 521 "src/yacc.y"
              {lhs.push_back("unary_op");rhs.push_back("SUB");}
#line 2823 "y.tab.c"
    break;

  case 183:
#line 522 "src/yacc.y"
              {lhs.push_back("unary_op");rhs.push_back("NOT");}
#line 2829 "y.tab.c"
    break;

  case 184:
#line 523 "src/yacc.y"
              {lhs.push_back("unary_op");rhs.push_back("XOR");}
#line 2835 "y.tab.c"
    break;

  case 185:
#line 524 "src/yacc.y"
              {lhs.push_back("unary_op");rhs.push_back("MUL");}
#line 2841 "y.tab.c"
    break;

  case 186:
#line 525 "src/yacc.y"
              {lhs.push_back("unary_op");rhs.push_back("AND");}
#line 2847 "y.tab.c"
    break;

  case 187:
#line 530 "src/yacc.y"
                 {lhs.push_back("assign_op");rhs.push_back("ASSIGN");}
#line 2853 "y.tab.c"
    break;

  case 188:
#line 531 "src/yacc.y"
                     {lhs.push_back("assign_op");rhs.push_back("ADD_ASSIGN");}
#line 2859 "y.tab.c"
    break;

  case 189:
#line 532 "src/yacc.y"
                     {lhs.push_back("assign_op");rhs.push_back("SUB_ASSIGN");}
#line 2865 "y.tab.c"
    break;

  case 190:
#line 533 "src/yacc.y"
                     {lhs.push_back("assign_op");rhs.push_back("MUL_ASSIGN");}
#line 2871 "y.tab.c"
    break;

  case 191:
#line 534 "src/yacc.y"
                     {lhs.push_back("assign_op");rhs.push_back("QUO_ASSIGN");}
#line 2877 "y.tab.c"
    break;

  case 192:
#line 535 "src/yacc.y"
                     {lhs.push_back("assign_op");rhs.push_back("REM_ASSIGN");}
#line 2883 "y.tab.c"
    break;

  case 193:
#line 541 "src/yacc.y"
                                       {lhs.push_back("PackageClause");rhs.push_back("PACKAGE PackageName");}
#line 2889 "y.tab.c"
    break;

  case 194:
#line 544 "src/yacc.y"
                   {lhs.push_back("PackageName");rhs.push_back("IDENTIFIER");}
#line 2895 "y.tab.c"
    break;

  case 195:
#line 549 "src/yacc.y"
                                 {lhs.push_back("ImportDeclList");rhs.push_back("ImportDeclList ImportDecl");}
#line 2901 "y.tab.c"
    break;

  case 196:
#line 550 "src/yacc.y"
                  {lhs.push_back("ImportDeclList");rhs.push_back("ImportDecl");}
#line 2907 "y.tab.c"
    break;

  case 197:
#line 551 "src/yacc.y"
                {lhs.push_back("ImportDeclList");rhs.push_back("/*empty*/");}
#line 2913 "y.tab.c"
    break;

  case 198:
#line 555 "src/yacc.y"
                                    {lhs.push_back("ImportDecl");rhs.push_back("IMPORT ImportSpec SEMICOLON");}
#line 2919 "y.tab.c"
    break;

  case 199:
#line 556 "src/yacc.y"
                                               {lhs.push_back("ImportDecl");rhs.push_back("IMPORT LPAREN ImportSpecList  RPAREN");}
#line 2925 "y.tab.c"
    break;

  case 200:
#line 560 "src/yacc.y"
                                            {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpecList ImportSpec SEMICOLON");}
#line 2931 "y.tab.c"
    break;

  case 201:
#line 561 "src/yacc.y"
                               {lhs.push_back("ImportSpecList");rhs.push_back("ImportSpec SEMICOLON");}
#line 2937 "y.tab.c"
    break;

  case 202:
#line 564 "src/yacc.y"
                           {lhs.push_back("ImportSpec");rhs.push_back("PERIOD ImportPath");}
#line 2943 "y.tab.c"
    break;

  case 203:
#line 565 "src/yacc.y"
                                  {lhs.push_back("ImportSpec");rhs.push_back("PackageName2 ImportPath");}
#line 2949 "y.tab.c"
    break;

  case 204:
#line 566 "src/yacc.y"
                       {lhs.push_back("ImportSpec");rhs.push_back("PackageName2");}
#line 2955 "y.tab.c"
    break;

  case 205:
#line 568 "src/yacc.y"
                   {lhs.push_back("ImportPath");rhs.push_back("string_lit");}
#line 2961 "y.tab.c"
    break;

  case 206:
#line 571 "src/yacc.y"
                   {lhs.push_back("PackageName2");rhs.push_back("string_lit");}
#line 2967 "y.tab.c"
    break;


#line 2971 "y.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 574 "src/yacc.y"



int main (void) {
	
	printf("Inside main\n");
	FILE * fp= fopen("test/test1.go", "r");	//taking input as argument
	yyin = fp;
	printf("Read the input file, continue with Lexing and Parsing\n");
	printf("Performing Lexical analysis......\n\n");
	yyparse ( );
	printf("Parsing completed.\n\n");
	printf("Symbol Table after Lexical Analysis: \n");
	Display();
	reverse(lhs.begin(),lhs.end());
	reverse(rhs.begin(),rhs.end());
	fstream grammar;
	grammar.open("grammar.txt",ios_base::out);
	for(int i=0;i<lhs.size();i++){
			grammar << lhs[i] << " -> "<< rhs[i] << "$" << endl;
	}
	grammar.close();
	return 0;
}












