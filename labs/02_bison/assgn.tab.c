/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 2 "assgn.y"

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
int yylex (void);
void yyerror (const char *);

char * tabs(int n)
{
  char *s = (char *)malloc(n+1);
  memset(s, '\t', n);
  s[n]='\0';
  return s;
}
typedef struct Node
{
  char *str;
  struct Node* next;
} Node;

typedef struct List
{
  struct Node* head, *tail;
} List;
int left;
void printList(List* l)
{
  Node* n = l->head;
  while(n != NULL)
  {
	if(strcmp(n->str, "{") == 0)
    {
		left++;
		printf("%s\n%s", n->str, tabs(left));
	}
	else if(strcmp(n->str, "}") == 0)
	{
		left--;
		printf("\n%s%s\n%s",tabs(left), n->str, tabs(left));
	}
	else if(strcmp(n->str, ";") == 0)
	{
		printf("%s\n%s", n->str, tabs(left));
	}
	else{
		printf("%s ", n->str);
	}
    n = n->next;
  }
}
typedef struct Macro
{
  Node* id;
  List* args, *replacement;
  bool isExpr;
  struct Macro* next;
} Macro;

Macro* newMacro(Node* id, List* args, List *replacement, bool isExpr)
{
  Macro * m = (Macro *)malloc(sizeof(Macro));
  m->id = id;
  m->args = args;
  m->replacement = replacement;
  m->isExpr = isExpr;
  m->next = NULL;
}

typedef struct MacroList
{
  Macro* head,* tail; 
} MacroList;

MacroList *macros;


void appendMacro(Macro* m)
{
  if(macros->head == NULL)
  {
    macros->head = m;
    macros->tail = m;
  }
  else
  {
    macros->tail->next = m;
    macros->tail = m;
  }
}
Node* newNode(char* str)
{
  Node* n = (Node*)malloc(sizeof(Node));
  n->str = malloc(strlen(str)+1);
  n->next = NULL;
  strcpy(n->str, str);
  return n;
};

void addNode(Node* n, List* l)
{
  if(l->head == NULL)
  {
    l->head = n;
    l->tail = n;
  }
  else
  {
    l->tail->next = n;
    l->tail = n;
  }
}

int isEmpty(List* l)
{
  return l->head == NULL;
}

void combineList(List* l1, List* l2)
{
  if(!isEmpty(l2)){
    if(isEmpty(l1)){
      l1->head = l2->head;
      l1->tail = l2->tail;
    }
    else{
      l1->tail->next = l2->head;
      l1->tail = l2->tail;
    }
  }
};

List* createList()
{
  List* l = (struct List*)malloc(sizeof(List));
  l->head = NULL;
  l->tail = NULL;
  return l;
};
List* createNodeList(char* str)
{
  List* l = createList();
  addNode(newNode(str), l);
  return l;
}

List* copyList(struct List* l)
{
	struct List* copyList = createList();
	struct Node* n = l->head;
	while(n!=NULL)
	{
		addNode(newNode(n->str), copyList);
		n = n->next;
	}	
	return copyList;
}

typedef struct ExpressionNode{
	List* list;
	struct ExpressionNode* next;
} ExpressionNode;

typedef struct ExpressionList{
	ExpressionNode* head, *tail;
} ExpressionList;

ExpressionNode* createExpressionNode(List* l)
{
	ExpressionNode* n = (ExpressionNode*)malloc(sizeof(ExpressionNode));
	n->list = copyList(l);
	n->next = NULL;
}

ExpressionList* createExpressionList()
{
	ExpressionList* l = (ExpressionList*)malloc(sizeof(ExpressionList));
	l->head = NULL;
	l->tail = NULL;
	return l;
}

void combineExpressionList(ExpressionList*l1 ,ExpressionList* l2)
{
	if(!(l2->head == NULL)){
		if(l1->head == NULL){
			l1->head = l2->head;
			l1->tail = l2->tail;
		}
		else{
			l1->tail->next = l2->head;
			l1->tail = l2->tail;
		}
	}
}
void addExpressionNode(ExpressionNode* n, ExpressionList* l)
{ 
	if(l->head == NULL){
		l->head = n;
		l->tail = n;
	}
	else{
		l->tail->next = n;
		l->tail = n;
	}
}
List* listOfExpressionList(ExpressionList* l)
{
	List* list=createList();
	ExpressionNode* n = l->head;
	while(n)
	{
		combineList(list, n->list);
		n = n->next;
		if(n)
		{
			addNode(newNode(","), list);
		}
	}
	return list;
}
List* listOfExpressionList2(ExpressionList* l)
{
	List* list=createList();
	ExpressionNode* n = l->head;
	while(n)
	{
		combineList(list, n->list);
		n = n->next;
	}
	return list;
}
void replaceNode(ExpressionNode* n1, ExpressionNode* n2) //Assuming l is never empty
{
	n1->list = copyList(n2->list);
}
void deleteList(List* l)
{
  Node* n = l->head;
  while(n)
  {
    Node* tmp = n->next;
    free (n->str);
    free (n);
    n = tmp;
  }
  free (l);
}
void deleteMarcoList(MacroList* l)
{
  Macro* n = l->head;
  while(n)
  {
    Macro* tmp = n->next;
    free (n->id);
    deleteList(n->args);
    deleteList(n->replacement);
    free (n);
    n = tmp;
  }
  free (l);
}

#line 335 "assgn.tab.c"

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


/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    EQ = 258,                      /* EQ  */
    LEQ = 259,                     /* LEQ  */
    AND = 260,                     /* AND  */
    OR = 261,                      /* OR  */
    NOT = 262,                     /* NOT  */
    ADD = 263,                     /* ADD  */
    SUB = 264,                     /* SUB  */
    MUL = 265,                     /* MUL  */
    DIV = 266,                     /* DIV  */
    NEQ = 267,                     /* NEQ  */
    DOT = 268,                     /* DOT  */
    TRUE = 269,                    /* TRUE  */
    FALSE = 270,                   /* FALSE  */
    THIS = 271,                    /* THIS  */
    NEW = 272,                     /* NEW  */
    LEFTPAR = 273,                 /* LEFTPAR  */
    RIGHTPAR = 274,                /* RIGHTPAR  */
    LEFTCURLY = 275,               /* LEFTCURLY  */
    RIGHTCURLY = 276,              /* RIGHTCURLY  */
    CLASS = 277,                   /* CLASS  */
    PRINTLN = 278,                 /* PRINTLN  */
    PUBLIC = 279,                  /* PUBLIC  */
    STATIC = 280,                  /* STATIC  */
    VOID = 281,                    /* VOID  */
    MAIN = 282,                    /* MAIN  */
    SEMICOLON = 283,               /* SEMICOLON  */
    EXTENDS = 284,                 /* EXTENDS  */
    LEFTSQUARE = 285,              /* LEFTSQUARE  */
    RIGHTSQUARE = 286,             /* RIGHTSQUARE  */
    COMMA = 287,                   /* COMMA  */
    RETURN = 288,                  /* RETURN  */
    IF = 289,                      /* IF  */
    ELSE = 290,                    /* ELSE  */
    WHILE = 291,                   /* WHILE  */
    STRING = 292,                  /* STRING  */
    INT = 293,                     /* INT  */
    BOOLEAN = 294,                 /* BOOLEAN  */
    IDENTIFIER = 295,              /* IDENTIFIER  */
    LENGTH = 296,                  /* LENGTH  */
    INTEGER = 297,                 /* INTEGER  */
    DEFINESTMT = 298,              /* DEFINESTMT  */
    DEFINESTMT0 = 299,             /* DEFINESTMT0  */
    DEFINESTMT1 = 300,             /* DEFINESTMT1  */
    DEFINESTMT2 = 301,             /* DEFINESTMT2  */
    DEFINEEXPR = 302,              /* DEFINEEXPR  */
    DEFINEEXPR0 = 303,             /* DEFINEEXPR0  */
    DEFINEEXPR1 = 304,             /* DEFINEEXPR1  */
    DEFINEEXPR2 = 305              /* DEFINEEXPR2  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 266 "assgn.y"

  char* string;
  List* list;
  ExpressionList* expressionList;

#line 438 "assgn.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);



/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_EQ = 3,                         /* EQ  */
  YYSYMBOL_LEQ = 4,                        /* LEQ  */
  YYSYMBOL_AND = 5,                        /* AND  */
  YYSYMBOL_OR = 6,                         /* OR  */
  YYSYMBOL_NOT = 7,                        /* NOT  */
  YYSYMBOL_ADD = 8,                        /* ADD  */
  YYSYMBOL_SUB = 9,                        /* SUB  */
  YYSYMBOL_MUL = 10,                       /* MUL  */
  YYSYMBOL_DIV = 11,                       /* DIV  */
  YYSYMBOL_NEQ = 12,                       /* NEQ  */
  YYSYMBOL_DOT = 13,                       /* DOT  */
  YYSYMBOL_TRUE = 14,                      /* TRUE  */
  YYSYMBOL_FALSE = 15,                     /* FALSE  */
  YYSYMBOL_THIS = 16,                      /* THIS  */
  YYSYMBOL_NEW = 17,                       /* NEW  */
  YYSYMBOL_LEFTPAR = 18,                   /* LEFTPAR  */
  YYSYMBOL_RIGHTPAR = 19,                  /* RIGHTPAR  */
  YYSYMBOL_LEFTCURLY = 20,                 /* LEFTCURLY  */
  YYSYMBOL_RIGHTCURLY = 21,                /* RIGHTCURLY  */
  YYSYMBOL_CLASS = 22,                     /* CLASS  */
  YYSYMBOL_PRINTLN = 23,                   /* PRINTLN  */
  YYSYMBOL_PUBLIC = 24,                    /* PUBLIC  */
  YYSYMBOL_STATIC = 25,                    /* STATIC  */
  YYSYMBOL_VOID = 26,                      /* VOID  */
  YYSYMBOL_MAIN = 27,                      /* MAIN  */
  YYSYMBOL_SEMICOLON = 28,                 /* SEMICOLON  */
  YYSYMBOL_EXTENDS = 29,                   /* EXTENDS  */
  YYSYMBOL_LEFTSQUARE = 30,                /* LEFTSQUARE  */
  YYSYMBOL_RIGHTSQUARE = 31,               /* RIGHTSQUARE  */
  YYSYMBOL_COMMA = 32,                     /* COMMA  */
  YYSYMBOL_RETURN = 33,                    /* RETURN  */
  YYSYMBOL_IF = 34,                        /* IF  */
  YYSYMBOL_ELSE = 35,                      /* ELSE  */
  YYSYMBOL_WHILE = 36,                     /* WHILE  */
  YYSYMBOL_STRING = 37,                    /* STRING  */
  YYSYMBOL_INT = 38,                       /* INT  */
  YYSYMBOL_BOOLEAN = 39,                   /* BOOLEAN  */
  YYSYMBOL_IDENTIFIER = 40,                /* IDENTIFIER  */
  YYSYMBOL_LENGTH = 41,                    /* LENGTH  */
  YYSYMBOL_INTEGER = 42,                   /* INTEGER  */
  YYSYMBOL_DEFINESTMT = 43,                /* DEFINESTMT  */
  YYSYMBOL_DEFINESTMT0 = 44,               /* DEFINESTMT0  */
  YYSYMBOL_DEFINESTMT1 = 45,               /* DEFINESTMT1  */
  YYSYMBOL_DEFINESTMT2 = 46,               /* DEFINESTMT2  */
  YYSYMBOL_DEFINEEXPR = 47,                /* DEFINEEXPR  */
  YYSYMBOL_DEFINEEXPR0 = 48,               /* DEFINEEXPR0  */
  YYSYMBOL_DEFINEEXPR1 = 49,               /* DEFINEEXPR1  */
  YYSYMBOL_DEFINEEXPR2 = 50,               /* DEFINEEXPR2  */
  YYSYMBOL_YYACCEPT = 51,                  /* $accept  */
  YYSYMBOL_goal = 52,                      /* goal  */
  YYSYMBOL_macroDef = 53,                  /* macroDef  */
  YYSYMBOL_macroDefinition = 54,           /* macroDefinition  */
  YYSYMBOL_macroDefStatement = 55,         /* macroDefStatement  */
  YYSYMBOL_macroDefExpression = 56,        /* macroDefExpression  */
  YYSYMBOL_multipleIdentifiers = 57,       /* multipleIdentifiers  */
  YYSYMBOL_typeDeclare = 58,               /* typeDeclare  */
  YYSYMBOL_mainClass = 59,                 /* mainClass  */
  YYSYMBOL_typeDeclaration = 60,           /* typeDeclaration  */
  YYSYMBOL_identifierDeclaration = 61,     /* identifierDeclaration  */
  YYSYMBOL_multipleIdentifierDeclaration = 62, /* multipleIdentifierDeclaration  */
  YYSYMBOL_multipleMethodDeclaration = 63, /* multipleMethodDeclaration  */
  YYSYMBOL_methodDeclaration = 64,         /* methodDeclaration  */
  YYSYMBOL_arguments = 65,                 /* arguments  */
  YYSYMBOL_multipleArguments = 66,         /* multipleArguments  */
  YYSYMBOL_type = 67,                      /* type  */
  YYSYMBOL_statement = 68,                 /* statement  */
  YYSYMBOL_multipleStatements = 69,        /* multipleStatements  */
  YYSYMBOL_expression = 70,                /* expression  */
  YYSYMBOL_expressions = 71,               /* expressions  */
  YYSYMBOL_multipleExpressions = 72,       /* multipleExpressions  */
  YYSYMBOL_primaryExpression = 73,         /* primaryExpression  */
  YYSYMBOL_eq = 74,                        /* eq  */
  YYSYMBOL_leq = 75,                       /* leq  */
  YYSYMBOL_and = 76,                       /* and  */
  YYSYMBOL_or = 77,                        /* or  */
  YYSYMBOL_not = 78,                       /* not  */
  YYSYMBOL_add = 79,                       /* add  */
  YYSYMBOL_sub = 80,                       /* sub  */
  YYSYMBOL_mul = 81,                       /* mul  */
  YYSYMBOL_div = 82,                       /* div  */
  YYSYMBOL_dot = 83,                       /* dot  */
  YYSYMBOL_true = 84,                      /* true  */
  YYSYMBOL_false = 85,                     /* false  */
  YYSYMBOL_this = 86,                      /* this  */
  YYSYMBOL_new = 87,                       /* new  */
  YYSYMBOL_leftpar = 88,                   /* leftpar  */
  YYSYMBOL_rightpar = 89,                  /* rightpar  */
  YYSYMBOL_leftcurly = 90,                 /* leftcurly  */
  YYSYMBOL_rightcurly = 91,                /* rightcurly  */
  YYSYMBOL_class = 92,                     /* class  */
  YYSYMBOL_println = 93,                   /* println  */
  YYSYMBOL_public = 94,                    /* public  */
  YYSYMBOL_static = 95,                    /* static  */
  YYSYMBOL_void = 96,                      /* void  */
  YYSYMBOL_main = 97,                      /* main  */
  YYSYMBOL_semicolon = 98,                 /* semicolon  */
  YYSYMBOL_extends = 99,                   /* extends  */
  YYSYMBOL_leftsquare = 100,               /* leftsquare  */
  YYSYMBOL_rightsquare = 101,              /* rightsquare  */
  YYSYMBOL_comma = 102,                    /* comma  */
  YYSYMBOL_return = 103,                   /* return  */
  YYSYMBOL_if = 104,                       /* if  */
  YYSYMBOL_else = 105,                     /* else  */
  YYSYMBOL_while = 106,                    /* while  */
  YYSYMBOL_string = 107,                   /* string  */
  YYSYMBOL_int = 108,                      /* int  */
  YYSYMBOL_boolean = 109,                  /* boolean  */
  YYSYMBOL_identifier = 110,               /* identifier  */
  YYSYMBOL_length = 111,                   /* length  */
  YYSYMBOL_integer = 112,                  /* integer  */
  YYSYMBOL_definestmt = 113,               /* definestmt  */
  YYSYMBOL_definestmt0 = 114,              /* definestmt0  */
  YYSYMBOL_definestmt1 = 115,              /* definestmt1  */
  YYSYMBOL_definestmt2 = 116,              /* definestmt2  */
  YYSYMBOL_defineexpr = 117,               /* defineexpr  */
  YYSYMBOL_defineexpr0 = 118,              /* defineexpr0  */
  YYSYMBOL_defineexpr1 = 119,              /* defineexpr1  */
  YYSYMBOL_defineexpr2 = 120,              /* defineexpr2  */
  YYSYMBOL_neq = 121                       /* neq  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




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

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
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
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
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

#if !defined yyoverflow

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
#endif /* !defined yyoverflow */

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
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   397

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  51
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  71
/* YYNRULES -- Number of rules.  */
#define YYNRULES  119
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  293

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   305


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

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
      45,    46,    47,    48,    49,    50
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   296,   296,   307,   308,   310,   311,   313,   325,   333,
     342,   354,   368,   378,   389,   402,   403,   410,   416,   418,
     445,   455,   468,   476,   477,   484,   485,   492,   510,   511,
     519,   520,   529,   536,   541,   546,   552,   559,   568,   576,
     587,   596,   607,   616,   690,   691,   698,   705,   712,   719,
     726,   733,   740,   747,   754,   762,   769,   774,   785,   859,
     860,   867,   868,   875,   880,   885,   890,   895,   900,   909,
     917,   923,   931,   933,   935,   937,   939,   941,   943,   945,
     947,   950,   952,   954,   956,   958,   960,   962,   964,   967,
     969,   971,   973,   975,   977,   979,   981,   984,   986,   988,
     990,   992,   994,   996,   998,  1001,  1003,  1005,  1007,  1009,
    1011,  1014,  1016,  1018,  1020,  1023,  1025,  1027,  1029,  1031
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "EQ", "LEQ", "AND",
  "OR", "NOT", "ADD", "SUB", "MUL", "DIV", "NEQ", "DOT", "TRUE", "FALSE",
  "THIS", "NEW", "LEFTPAR", "RIGHTPAR", "LEFTCURLY", "RIGHTCURLY", "CLASS",
  "PRINTLN", "PUBLIC", "STATIC", "VOID", "MAIN", "SEMICOLON", "EXTENDS",
  "LEFTSQUARE", "RIGHTSQUARE", "COMMA", "RETURN", "IF", "ELSE", "WHILE",
  "STRING", "INT", "BOOLEAN", "IDENTIFIER", "LENGTH", "INTEGER",
  "DEFINESTMT", "DEFINESTMT0", "DEFINESTMT1", "DEFINESTMT2", "DEFINEEXPR",
  "DEFINEEXPR0", "DEFINEEXPR1", "DEFINEEXPR2", "$accept", "goal",
  "macroDef", "macroDefinition", "macroDefStatement", "macroDefExpression",
  "multipleIdentifiers", "typeDeclare", "mainClass", "typeDeclaration",
  "identifierDeclaration", "multipleIdentifierDeclaration",
  "multipleMethodDeclaration", "methodDeclaration", "arguments",
  "multipleArguments", "type", "statement", "multipleStatements",
  "expression", "expressions", "multipleExpressions", "primaryExpression",
  "eq", "leq", "and", "or", "not", "add", "sub", "mul", "div", "dot",
  "true", "false", "this", "new", "leftpar", "rightpar", "leftcurly",
  "rightcurly", "class", "println", "public", "static", "void", "main",
  "semicolon", "extends", "leftsquare", "rightsquare", "comma", "return",
  "if", "else", "while", "string", "int", "boolean", "identifier",
  "length", "integer", "definestmt", "definestmt0", "definestmt1",
  "definestmt2", "defineexpr", "defineexpr0", "defineexpr1", "defineexpr2",
  "neq", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-200)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     251,  -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,    12,
      -6,   251,  -200,  -200,   -15,   -15,   -15,   -15,   -15,   -15,
     -15,   -15,  -200,  -200,    -6,   -15,  -200,  -200,    29,    29,
      29,    29,    29,    29,    29,    29,  -200,    -6,   -15,    24,
    -200,   -15,    33,   -15,   -15,   -15,    33,   -15,   -15,  -200,
       3,  -200,    36,    16,  -200,    24,    33,    16,    16,    29,
      33,    16,  -200,  -200,   -15,  -200,    43,  -200,   -15,   127,
      24,   -15,   -15,   174,    29,   -15,    51,    24,  -200,    59,
      16,  -200,  -200,  -200,   127,    48,   127,    29,    29,    29,
      46,   127,    33,    16,  -200,  -200,  -200,  -200,  -200,  -200,
      33,   334,   174,  -200,  -200,  -200,   -12,   174,    29,  -200,
     174,    33,  -200,  -200,  -200,    48,    36,   -15,    93,    58,
    -200,  -200,  -200,  -200,    66,   -15,  -200,  -200,  -200,    48,
     174,   174,   174,  -200,  -200,   174,   174,   174,    48,    24,
     -15,  -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,
    -200,   174,   174,   174,   174,   174,   174,   174,   -19,   174,
     174,  -200,    58,    29,    33,   174,    33,    29,  -200,  -200,
      72,   -15,    70,    51,  -200,    29,    16,  -200,    33,    33,
      33,    72,    16,    33,    70,  -200,   127,    16,  -200,  -200,
    -200,  -200,  -200,  -200,  -200,  -200,  -200,    29,  -200,    70,
    -200,   174,    33,  -200,    33,  -200,   174,  -200,  -200,    29,
    -200,  -200,    48,    68,    33,   -15,    72,   127,   127,  -200,
    -200,   174,    72,   105,    48,    33,   174,  -200,    70,  -200,
    -200,    33,    93,  -200,  -200,    58,    24,    16,  -200,    74,
    -200,    16,  -200,   174,  -200,    29,    33,  -200,  -200,    33,
     -15,    70,   127,  -200,  -200,   127,  -200,    72,   174,  -200,
      24,    16,   -15,    48,  -200,  -200,    33,  -200,  -200,    93,
      33,  -200,  -200,   186,   -15,    24,    79,    46,    16,    90,
    -200,   174,  -200,    29,    72,   174,    48,    33,  -200,    72,
      48,    48,  -200
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       4,   111,   112,   113,   114,   115,   116,   117,   118,     0,
       0,     4,     6,     5,     0,     0,     0,     0,     0,     0,
       0,     0,     1,    90,    18,     0,     3,   108,     0,     0,
       0,     0,     0,     0,     0,     0,     2,    18,     0,     0,
      86,     0,     0,     0,     0,     0,     0,     0,     0,    17,
       0,    88,     0,     0,    87,     0,     0,     0,     0,     0,
       0,     0,    97,    23,     0,    92,     0,   100,     0,    44,
       0,     0,     0,     0,     0,     0,    25,     0,    93,     0,
       0,    91,   102,   104,    44,     0,    44,     0,     0,     0,
       0,    44,     0,     0,    76,    82,    83,    84,    85,   110,
       0,    56,     0,    64,    65,    67,     0,     0,    66,    63,
       0,     0,   106,   107,    24,     0,    25,     0,     0,    34,
      33,    35,    23,    94,     0,     0,    45,    89,     8,     0,
       0,     0,     0,    72,    98,     0,    61,     0,     0,     0,
       0,    12,    73,    74,    75,    77,    78,    79,    80,   119,
      81,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    70,     0,     0,     0,    61,     0,     0,    20,    26,
       0,     0,     0,    25,    95,     0,    15,    36,     0,     0,
       0,     0,    59,     0,     0,     9,    44,    15,    49,    66,
      46,    47,    50,    51,    52,    53,   109,     0,    55,     0,
      48,     0,     0,    71,     0,    13,     0,    96,    22,     0,
      99,    32,     0,     0,     0,     0,     0,     0,     0,    38,
      62,     0,     0,     0,     0,     0,    61,    54,     0,    69,
      58,     0,    28,    21,   105,     0,     0,    15,    37,    40,
      42,    59,    43,     0,    10,     0,     0,    68,    14,     0,
       0,     0,    44,    16,   103,     0,    60,     0,     0,    57,
       0,    30,     0,     0,    41,    39,     0,    23,    29,     0,
       0,     7,    11,    44,     0,     0,     0,    35,    30,     0,
     101,     0,    31,     0,     0,     0,     0,     0,    27,     0,
       0,     0,    19
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -200,  -200,   104,  -200,  -200,  -200,  -178,    80,  -200,  -200,
    -200,  -109,   -99,  -200,  -200,  -160,  -104,  -199,   -76,    -8,
    -116,  -145,   198,  -103,  -200,  -200,  -200,  -200,  -200,  -200,
    -200,  -200,  -200,  -200,  -200,  -200,  -200,     8,   110,    -4,
      39,   124,  -143,    97,  -200,  -200,  -200,  -136,  -200,   -48,
    -121,    26,  -200,  -200,  -200,  -200,  -200,    45,  -200,   -14,
    -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,  -200,
    -200
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
       0,     9,    10,    11,    12,    13,   214,    36,    24,    37,
     114,    76,   115,   116,   249,   268,   117,    84,    85,   182,
     220,   183,   101,   135,   151,   152,   153,   102,   154,   155,
     156,   157,   158,   103,   104,   105,   106,   107,    55,    86,
     128,    38,    87,   118,    79,   124,   175,   208,    64,   137,
     211,   215,   281,    88,   255,    89,   235,   119,   120,   108,
     198,   109,    14,    15,    16,    17,    18,    19,    20,    21,
     160
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      28,    29,    30,    31,    32,    33,    34,    35,   126,   225,
     129,    39,    22,   173,   171,   138,    23,   169,   239,   240,
     204,    27,   196,    51,    50,    27,   112,    53,    27,    56,
      57,    58,    62,    60,    61,    52,    41,    42,    43,    44,
      45,    46,    47,    48,    51,   219,    63,    40,    67,   133,
      77,    69,    54,   159,    80,    90,   264,    92,    93,   253,
      65,   111,   121,   223,    40,   100,    91,    73,    78,   127,
      90,   172,    90,   122,   212,    65,   134,    90,   227,    68,
     238,   246,   110,    71,    72,   123,   242,    75,   134,   112,
     113,    27,   163,   174,   161,   130,   131,   132,   136,   164,
     207,   210,   166,   170,   121,   234,   125,   247,   133,   254,
     224,   176,   280,    81,   201,    26,   165,    49,   282,   140,
     243,   265,   178,   179,   180,   256,   187,   181,   250,   184,
     262,   112,   113,    27,    25,   186,   283,   189,   189,   189,
     189,   189,   189,   189,   197,   189,   189,    51,   286,    66,
      81,   162,     0,   290,   168,     0,    59,   209,   273,   121,
       0,    82,     0,    83,     0,   274,    70,    27,   177,     0,
      74,   202,    90,     0,     0,   206,   263,   185,     0,     0,
       0,    94,     0,   213,     0,     0,     0,   251,    95,    96,
      97,    98,    40,   228,     0,     0,     0,   276,   231,     0,
       0,   237,   139,    90,    90,   226,    51,     0,   221,    81,
     141,     0,     0,   241,    27,     0,    99,   232,   121,     0,
      82,   167,    83,     0,   112,   113,    27,     0,     0,     0,
       0,     0,   252,     0,     0,   257,   261,     0,    90,     0,
       0,    90,     0,     0,     0,     0,     0,     0,   270,     0,
     266,   233,     0,   258,     0,   121,   267,     0,     0,   277,
     278,     0,     0,   244,     0,     0,     0,   221,     0,     0,
       0,   279,     0,   284,   203,     0,   205,   287,     0,     0,
       0,     0,     0,     0,     0,   136,     0,   269,   216,   217,
     218,   285,     0,   222,     1,     2,     3,     4,     5,     6,
       7,     8,   271,     0,   269,     0,     0,     0,     0,     0,
       0,     0,   229,     0,   230,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   236,   288,     0,     0,     0,   291,
     292,     0,     0,     0,     0,   245,     0,     0,   142,   143,
     144,   248,   145,   146,   147,   148,   149,   150,     0,   188,
     190,   191,   192,   193,   194,   195,   259,   199,   200,   260,
       0,     0,     0,     0,   134,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   272,     0,     0,     0,
     275,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   289
};

static const yytype_int16 yycheck[] =
{
      14,    15,    16,    17,    18,    19,    20,    21,    84,   187,
      86,    25,     0,   122,   118,    91,    22,   116,   217,   218,
     165,    40,    41,    20,    38,    40,    38,    41,    40,    43,
      44,    45,    29,    47,    48,    39,    28,    29,    30,    31,
      32,    33,    34,    35,    20,   181,    50,    18,    32,     3,
      64,    55,    19,   101,    68,    69,   255,    71,    72,   237,
      24,    75,    76,   184,    18,    73,    70,    59,    25,    21,
      84,   119,    86,    77,   173,    24,    30,    91,   199,    53,
     216,   226,    74,    57,    58,    26,   222,    61,    30,    38,
      39,    40,   106,    27,   102,    87,    88,    89,    90,   107,
      28,    31,   110,   117,   118,    37,    80,   228,     3,    35,
     186,   125,    33,    23,   162,    11,   108,    37,   278,    93,
     223,   257,   130,   131,   132,   241,   140,   135,   232,   137,
     251,    38,    39,    40,    10,   139,   279,   151,   152,   153,
     154,   155,   156,   157,   158,   159,   160,    20,   284,    52,
      23,   106,    -1,   289,   115,    -1,    46,   171,   267,   173,
      -1,    34,    -1,    36,    -1,   269,    56,    40,   129,    -1,
      60,   163,   186,    -1,    -1,   167,   252,   138,    -1,    -1,
      -1,     7,    -1,   175,    -1,    -1,    -1,   235,    14,    15,
      16,    17,    18,   201,    -1,    -1,    -1,   273,   206,    -1,
      -1,   215,    92,   217,   218,   197,    20,    -1,   182,    23,
     100,    -1,    -1,   221,    40,    -1,    42,   209,   232,    -1,
      34,   111,    36,    -1,    38,    39,    40,    -1,    -1,    -1,
      -1,    -1,   236,    -1,    -1,   243,   250,    -1,   252,    -1,
      -1,   255,    -1,    -1,    -1,    -1,    -1,    -1,   262,    -1,
     258,   212,    -1,   245,    -1,   269,   260,    -1,    -1,   273,
     274,    -1,    -1,   224,    -1,    -1,    -1,   241,    -1,    -1,
      -1,   275,    -1,   281,   164,    -1,   166,   285,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   277,    -1,   261,   178,   179,
     180,   283,    -1,   183,    43,    44,    45,    46,    47,    48,
      49,    50,   263,    -1,   278,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   202,    -1,   204,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   214,   286,    -1,    -1,    -1,   290,
     291,    -1,    -1,    -1,    -1,   225,    -1,    -1,     4,     5,
       6,   231,     8,     9,    10,    11,    12,    13,    -1,   151,
     152,   153,   154,   155,   156,   157,   246,   159,   160,   249,
      -1,    -1,    -1,    -1,    30,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   266,    -1,    -1,    -1,
     270,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   287
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    43,    44,    45,    46,    47,    48,    49,    50,    52,
      53,    54,    55,    56,   113,   114,   115,   116,   117,   118,
     119,   120,     0,    22,    59,    92,    53,    40,   110,   110,
     110,   110,   110,   110,   110,   110,    58,    60,    92,   110,
      18,    88,    88,    88,    88,    88,    88,    88,    88,    58,
     110,    20,    90,   110,    19,    89,   110,   110,   110,    89,
     110,   110,    29,    90,    99,    24,    94,    32,   102,    90,
      89,   102,   102,    88,    89,   102,    62,   110,    25,    95,
     110,    23,    34,    36,    68,    69,    90,    93,   104,   106,
     110,    90,   110,   110,     7,    14,    15,    16,    17,    42,
      70,    73,    78,    84,    85,    86,    87,    88,   110,   112,
      88,   110,    38,    39,    61,    63,    64,    67,    94,   108,
     109,   110,    90,    26,    96,   102,    69,    21,    91,    69,
      88,    88,    88,     3,    30,    74,    88,   100,    69,    89,
     102,    89,     4,     5,     6,     8,     9,    10,    11,    12,
      13,    75,    76,    77,    79,    80,    81,    82,    83,   100,
     121,    70,   108,   110,    70,    88,    70,    89,    91,    63,
     110,    67,   100,    62,    27,    97,   110,    91,    70,    70,
      70,    70,    70,    72,    70,    91,    90,   110,    73,   110,
      73,    73,    73,    73,    73,    73,    41,   110,   111,    73,
      73,   100,    88,    89,    72,    89,    88,    28,    98,   110,
      31,   101,    63,    88,    57,   102,    89,    89,    89,    98,
      71,   102,    89,   101,    69,    57,    88,   101,    70,    89,
      89,    70,    88,    91,    37,   107,    89,   110,    98,    68,
      68,    70,    98,    74,    91,    89,    72,   101,    89,    65,
      67,   100,    90,    57,    35,   105,    71,    70,    88,    89,
      89,   110,   101,    69,    68,    98,    70,    90,    66,   102,
     110,    91,    89,    62,    67,    89,    69,   110,   110,    90,
      33,   103,    66,    93,    70,    88,    98,    70,    91,    89,
      98,    91,    91
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    51,    52,    53,    53,    54,    54,    55,    55,    55,
      55,    56,    56,    56,    56,    57,    57,    58,    58,    59,
      60,    60,    61,    62,    62,    63,    63,    64,    65,    65,
      66,    66,    67,    67,    67,    67,    68,    68,    68,    68,
      68,    68,    68,    68,    69,    69,    70,    70,    70,    70,
      70,    70,    70,    70,    70,    70,    70,    70,    70,    71,
      71,    72,    72,    73,    73,    73,    73,    73,    73,    73,
      73,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    83,    84,    85,    86,    87,    88,    89,    90,    91,
      92,    93,    94,    95,    96,    97,    98,    99,   100,   101,
     102,   103,   104,   105,   106,   107,   108,   109,   110,   111,
     112,   113,   114,   115,   116,   117,   118,   119,   120,   121
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     2,     0,     1,     1,    13,     7,     8,
      10,    13,     7,     8,    10,     0,     3,     2,     0,    21,
       6,     8,     3,     0,     2,     0,     2,    13,     0,     3,
       0,     4,     3,     1,     1,     1,     3,     5,     4,     7,
       5,     7,     5,     5,     0,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     4,     3,     1,     6,     4,     0,
       3,     0,     2,     1,     1,     1,     1,     1,     5,     4,
       2,     3,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


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

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


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




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
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
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
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
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
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
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
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






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
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
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

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
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
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
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
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

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
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
  case 2: /* goal: macroDef mainClass typeDeclare  */
#line 297 "assgn.y"
    {
      (yyval.list)=createList();
      combineList((yyval.list), (yyvsp[-1].list));
      combineList((yyval.list), (yyvsp[0].list));
      printList((yyval.list));
      deleteList((yyval.list));     
      deleteMarcoList(macros);
    }
#line 1768 "assgn.tab.c"
    break;

  case 4: /* macroDef: %empty  */
#line 308 "assgn.y"
                 {(yyval.list)=createList();}
#line 1774 "assgn.tab.c"
    break;

  case 7: /* macroDefStatement: definestmt identifier leftpar identifier comma identifier comma identifier multipleIdentifiers rightpar leftcurly multipleStatements rightcurly  */
#line 314 "assgn.y"
                  {
                    Node* id= (yyvsp[-11].list)->head;
                    List* args=createList();
                    combineList(args, (yyvsp[-9].list));
                    combineList(args, (yyvsp[-7].list));
                    combineList(args, (yyvsp[-5].list));
                    combineList(args, (yyvsp[-4].list));
                    List* replacement=copyList((yyvsp[-1].list));
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
#line 1790 "assgn.tab.c"
    break;

  case 8: /* macroDefStatement: definestmt0 identifier leftpar rightpar leftcurly multipleStatements rightcurly  */
#line 326 "assgn.y"
                  {
                    Node* id= (yyvsp[-5].list)->head;
                    List* args=createList();
                    List* replacement=copyList((yyvsp[-1].list));
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
#line 1802 "assgn.tab.c"
    break;

  case 9: /* macroDefStatement: definestmt1 identifier leftpar identifier rightpar leftcurly multipleStatements rightcurly  */
#line 334 "assgn.y"
                  {
                    Node* id= (yyvsp[-6].list)->head;
                    List* args=createList();
                    combineList(args, (yyvsp[-4].list));
                    List* replacement=copyList((yyvsp[-1].list));
                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
#line 1815 "assgn.tab.c"
    break;

  case 10: /* macroDefStatement: definestmt2 identifier leftpar identifier comma identifier rightpar leftcurly multipleStatements rightcurly  */
#line 343 "assgn.y"
                  {
                    Node* id= (yyvsp[-8].list)->head;
                    List* args=createList();
                    combineList(args, (yyvsp[-6].list));
                    combineList(args, (yyvsp[-4].list));
                    List* replacement=(yyvsp[-1].list);

                    Macro* macro=newMacro(id, args, replacement, false);
                    appendMacro(macro);
                  }
#line 1830 "assgn.tab.c"
    break;

  case 11: /* macroDefExpression: defineexpr identifier leftpar identifier comma identifier comma identifier multipleIdentifiers rightpar leftpar expression rightpar  */
#line 355 "assgn.y"
                    {
                      Node* id= (yyvsp[-11].list)->head;
                      List* args=createList();
                      combineList(args, (yyvsp[-9].list));
                      combineList(args, (yyvsp[-7].list));
                      combineList(args, (yyvsp[-5].list));
                      combineList(args, (yyvsp[-4].list));
                      List* replacement=copyList((yyvsp[-2].list));
                      combineList(replacement, (yyvsp[-1].list));
                      combineList(replacement, (yyvsp[0].list));
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
#line 1848 "assgn.tab.c"
    break;

  case 12: /* macroDefExpression: defineexpr0 identifier leftpar rightpar leftpar expression rightpar  */
#line 369 "assgn.y"
                    {
                      Node* id= (yyvsp[-5].list)->head;
                      List* args=createList();
                      List* replacement=copyList((yyvsp[-2].list));
                      combineList(replacement, (yyvsp[-1].list));
                      combineList(replacement, (yyvsp[0].list));
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
#line 1862 "assgn.tab.c"
    break;

  case 13: /* macroDefExpression: defineexpr1 identifier leftpar identifier rightpar leftpar expression rightpar  */
#line 379 "assgn.y"
                    {
                      Node* id= (yyvsp[-6].list)->head;
                      List* args=createList();
                      combineList(args, (yyvsp[-4].list));
                      List* replacement=copyList((yyvsp[-2].list));
                      combineList(replacement, (yyvsp[-1].list));
                      combineList(replacement, (yyvsp[0].list));
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
#line 1877 "assgn.tab.c"
    break;

  case 14: /* macroDefExpression: defineexpr2 identifier leftpar identifier comma identifier rightpar leftpar expression rightpar  */
#line 390 "assgn.y"
                    {
                      Node* id= (yyvsp[-8].list)->head;
                      List* args=createList();
                      combineList(args, (yyvsp[-6].list));
                      combineList(args, (yyvsp[-4].list));
                      List* replacement=copyList((yyvsp[-2].list));
                      combineList(replacement, (yyvsp[-1].list));
                      combineList(replacement, (yyvsp[0].list));
                      Macro* macro=newMacro(id, args, replacement, true);
                      appendMacro(macro);
                    }
#line 1893 "assgn.tab.c"
    break;

  case 15: /* multipleIdentifiers: %empty  */
#line 402 "assgn.y"
                           {(yyval.list)=createList();}
#line 1899 "assgn.tab.c"
    break;

  case 16: /* multipleIdentifiers: comma identifier multipleIdentifiers  */
#line 404 "assgn.y"
                    {
                      (yyval.list)=createList();
                      combineList((yyval.list), (yyvsp[-1].list));
                      combineList((yyval.list), (yyvsp[0].list));
                    }
#line 1909 "assgn.tab.c"
    break;

  case 17: /* typeDeclare: typeDeclaration typeDeclare  */
#line 411 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 1919 "assgn.tab.c"
    break;

  case 18: /* typeDeclare: %empty  */
#line 416 "assgn.y"
                     {(yyval.list)=createList();}
#line 1925 "assgn.tab.c"
    break;

  case 19: /* mainClass: class identifier leftcurly public static void main leftpar string leftsquare rightsquare identifier rightpar leftcurly println leftpar expression rightpar semicolon rightcurly rightcurly  */
#line 419 "assgn.y"
            {
				
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-20].list));
              combineList((yyval.list), (yyvsp[-19].list));
              combineList((yyval.list), (yyvsp[-18].list));
              combineList((yyval.list), (yyvsp[-17].list));
              combineList((yyval.list), (yyvsp[-16].list));
              combineList((yyval.list), (yyvsp[-15].list));
              combineList((yyval.list), (yyvsp[-14].list));
              combineList((yyval.list), (yyvsp[-13].list));
              combineList((yyval.list), (yyvsp[-12].list));
              combineList((yyval.list), (yyvsp[-11].list));
              combineList((yyval.list), (yyvsp[-10].list));
              combineList((yyval.list), (yyvsp[-9].list));
              combineList((yyval.list), (yyvsp[-8].list));
              combineList((yyval.list), (yyvsp[-7].list));
              combineList((yyval.list), (yyvsp[-6].list));
              combineList((yyval.list), (yyvsp[-5].list));
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 1955 "assgn.tab.c"
    break;

  case 20: /* typeDeclaration: class identifier leftcurly multipleIdentifierDeclaration multipleMethodDeclaration rightcurly  */
#line 446 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[-5].list));
                    combineList((yyval.list), (yyvsp[-4].list));
                    combineList((yyval.list), (yyvsp[-3].list));
                    combineList((yyval.list), (yyvsp[-2].list));
                    combineList((yyval.list), (yyvsp[-1].list));
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 1969 "assgn.tab.c"
    break;

  case 21: /* typeDeclaration: class identifier extends identifier leftcurly multipleIdentifierDeclaration multipleMethodDeclaration rightcurly  */
#line 456 "assgn.y"
                 {
                  (yyval.list)=createList();
                  combineList((yyval.list), (yyvsp[-7].list));
                  combineList((yyval.list), (yyvsp[-6].list));
                  combineList((yyval.list), (yyvsp[-5].list));
                  combineList((yyval.list), (yyvsp[-4].list));
                  combineList((yyval.list), (yyvsp[-3].list));
                  combineList((yyval.list), (yyvsp[-2].list));
                  combineList((yyval.list), (yyvsp[-1].list));
                  combineList((yyval.list), (yyvsp[0].list));
                 }
#line 1985 "assgn.tab.c"
    break;

  case 22: /* identifierDeclaration: type identifier semicolon  */
#line 469 "assgn.y"
                      {
                        (yyval.list)=createList();
                        combineList((yyval.list), (yyvsp[-2].list));
                        combineList((yyval.list), (yyvsp[-1].list));
                        combineList((yyval.list), (yyvsp[0].list));
                      }
#line 1996 "assgn.tab.c"
    break;

  case 23: /* multipleIdentifierDeclaration: %empty  */
#line 476 "assgn.y"
                                      {(yyval.list)=createList();}
#line 2002 "assgn.tab.c"
    break;

  case 24: /* multipleIdentifierDeclaration: multipleIdentifierDeclaration identifierDeclaration  */
#line 478 "assgn.y"
                             {
                              (yyval.list)=createList();
                              combineList((yyval.list), (yyvsp[-1].list));
                              combineList((yyval.list), (yyvsp[0].list));
                             }
#line 2012 "assgn.tab.c"
    break;

  case 25: /* multipleMethodDeclaration: %empty  */
#line 484 "assgn.y"
                                  {(yyval.list)=createList();}
#line 2018 "assgn.tab.c"
    break;

  case 26: /* multipleMethodDeclaration: methodDeclaration multipleMethodDeclaration  */
#line 486 "assgn.y"
                          {
                            (yyval.list)=createList();
                            combineList((yyval.list), (yyvsp[-1].list));
                            combineList((yyval.list), (yyvsp[0].list));
                          }
#line 2028 "assgn.tab.c"
    break;

  case 27: /* methodDeclaration: public type identifier leftpar arguments rightpar leftcurly multipleIdentifierDeclaration multipleStatements return expression semicolon rightcurly  */
#line 493 "assgn.y"
                    {
                      (yyval.list)=createList();
                      combineList((yyval.list), (yyvsp[-12].list));
                      combineList((yyval.list), (yyvsp[-11].list));
                      combineList((yyval.list), (yyvsp[-10].list));
                      combineList((yyval.list), (yyvsp[-9].list));
                      combineList((yyval.list), (yyvsp[-8].list));
                      combineList((yyval.list), (yyvsp[-7].list));
                      combineList((yyval.list), (yyvsp[-6].list));
                      combineList((yyval.list), (yyvsp[-5].list));
                      combineList((yyval.list), (yyvsp[-4].list));
                      combineList((yyval.list), (yyvsp[-3].list));
                      combineList((yyval.list), (yyvsp[-2].list));
                      combineList((yyval.list), (yyvsp[-1].list));
                      combineList((yyval.list), (yyvsp[0].list));
                    }
#line 2049 "assgn.tab.c"
    break;

  case 28: /* arguments: %empty  */
#line 510 "assgn.y"
                   {(yyval.list)=createList();}
#line 2055 "assgn.tab.c"
    break;

  case 29: /* arguments: type identifier multipleArguments  */
#line 512 "assgn.y"
          {
            (yyval.list)=createList();
            combineList((yyval.list), (yyvsp[-2].list));
            combineList((yyval.list), (yyvsp[-1].list));
            combineList((yyval.list), (yyvsp[0].list));
          }
#line 2066 "assgn.tab.c"
    break;

  case 30: /* multipleArguments: %empty  */
#line 519 "assgn.y"
                         {(yyval.list)=createList();}
#line 2072 "assgn.tab.c"
    break;

  case 31: /* multipleArguments: comma type identifier multipleArguments  */
#line 521 "assgn.y"
                 {
                  (yyval.list)=createList();
                  combineList((yyval.list), (yyvsp[-3].list));
                  combineList((yyval.list), (yyvsp[-2].list));
                  combineList((yyval.list), (yyvsp[-1].list));
				          combineList((yyval.list), (yyvsp[0].list));
                 }
#line 2084 "assgn.tab.c"
    break;

  case 32: /* type: int leftsquare rightsquare  */
#line 530 "assgn.y"
        {
          (yyval.list)=createList();
          combineList((yyval.list), (yyvsp[-2].list));
          combineList((yyval.list), (yyvsp[-1].list));
          combineList((yyval.list), (yyvsp[0].list));
        }
#line 2095 "assgn.tab.c"
    break;

  case 33: /* type: boolean  */
#line 537 "assgn.y"
        {
          (yyval.list)=createList();
          combineList((yyval.list), (yyvsp[0].list));
        }
#line 2104 "assgn.tab.c"
    break;

  case 34: /* type: int  */
#line 542 "assgn.y"
        {
          (yyval.list)=createList();
          combineList((yyval.list), (yyvsp[0].list));
        }
#line 2113 "assgn.tab.c"
    break;

  case 35: /* type: identifier  */
#line 547 "assgn.y"
        {
          (yyval.list)=createList();
          combineList((yyval.list), (yyvsp[0].list));
        }
#line 2122 "assgn.tab.c"
    break;

  case 36: /* statement: leftcurly multipleStatements rightcurly  */
#line 553 "assgn.y"
            {                                                                                    
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2133 "assgn.tab.c"
    break;

  case 37: /* statement: println leftpar expression rightpar semicolon  */
#line 560 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2146 "assgn.tab.c"
    break;

  case 38: /* statement: identifier eq expression semicolon  */
#line 569 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2158 "assgn.tab.c"
    break;

  case 39: /* statement: identifier leftsquare expression rightsquare eq expression semicolon  */
#line 577 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-6].list));
              combineList((yyval.list), (yyvsp[-5].list));
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2173 "assgn.tab.c"
    break;

  case 40: /* statement: if leftpar expression rightpar statement  */
#line 588 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2186 "assgn.tab.c"
    break;

  case 41: /* statement: if leftpar expression rightpar statement else statement  */
#line 597 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-6].list));
              combineList((yyval.list), (yyvsp[-5].list));
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2201 "assgn.tab.c"
    break;

  case 42: /* statement: while leftpar expression rightpar statement  */
#line 608 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2214 "assgn.tab.c"
    break;

  case 43: /* statement: identifier leftpar multipleExpressions rightpar semicolon  */
#line 617 "assgn.y"
            {
              (yyval.list)=createList();
              Macro* m= macros->head;
              ExpressionNode* reparg= (yyvsp[-2].expressionList)->head;
              int cnt1=0;

              ExpressionNode* tmp1= (yyvsp[-2].expressionList)->head;
              while(tmp1)
              {
                cnt1++;
                tmp1=tmp1->next;
              }
              
              while(m)
              {
                if((m->isExpr))
                {
                  m=m->next;
                  continue;
                }
                if(strcmp(m->id->str, (yyvsp[-4].list)->head->str)==0)
                {				
                  int cnt2=0;
                  Node* tmp2= m->args->head;
                  while(tmp2)
                  {
                    cnt2++;
                    tmp2= tmp2->next;
                  }
                  if(cnt2!=cnt1)
                  {
                    m=m->next;
                    continue;
                  }
                  Node* a= m->args->head;
                  ExpressionList* replaced = createExpressionList();
                  Node* tmp=m->replacement->head;
                  while(tmp)
                  {
                    addExpressionNode(createExpressionNode(createNodeList(tmp->str)), replaced);
                    tmp=tmp->next;
                  }
                  
                  while(a && reparg)
                  {
                    Node* repl= m->replacement->head;
                    ExpressionNode* final_repl=replaced->head;
                    while(repl)
                    {
                      if(strcmp(a->str, repl->str)==0)
                      {
                        replaceNode(final_repl, reparg);
                      }
                      repl=repl->next;
                      final_repl=final_repl->next;
                    }
                    a=a->next;
                    reparg=reparg->next;

                  }
                  (yyval.list)=listOfExpressionList2(replaced);
                  break;
                }
                m=m->next;
              
              }
              if(!m)
              {
                printf("//Macro Expression Definition not found\n");
                return -1;
              }
            }
#line 2291 "assgn.tab.c"
    break;

  case 44: /* multipleStatements: %empty  */
#line 690 "assgn.y"
                            {(yyval.list)=createList();}
#line 2297 "assgn.tab.c"
    break;

  case 45: /* multipleStatements: statement multipleStatements  */
#line 692 "assgn.y"
                    {
                      (yyval.list)=createList();
                      combineList((yyval.list), (yyvsp[-1].list));
                      combineList((yyval.list), (yyvsp[0].list));
                    }
#line 2307 "assgn.tab.c"
    break;

  case 46: /* expression: primaryExpression and primaryExpression  */
#line 699 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2318 "assgn.tab.c"
    break;

  case 47: /* expression: primaryExpression or primaryExpression  */
#line 706 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2329 "assgn.tab.c"
    break;

  case 48: /* expression: primaryExpression neq primaryExpression  */
#line 713 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2340 "assgn.tab.c"
    break;

  case 49: /* expression: primaryExpression leq primaryExpression  */
#line 720 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2351 "assgn.tab.c"
    break;

  case 50: /* expression: primaryExpression add primaryExpression  */
#line 727 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2362 "assgn.tab.c"
    break;

  case 51: /* expression: primaryExpression sub primaryExpression  */
#line 734 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2373 "assgn.tab.c"
    break;

  case 52: /* expression: primaryExpression mul primaryExpression  */
#line 741 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2384 "assgn.tab.c"
    break;

  case 53: /* expression: primaryExpression div primaryExpression  */
#line 748 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2395 "assgn.tab.c"
    break;

  case 54: /* expression: primaryExpression leftsquare primaryExpression rightsquare  */
#line 755 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2407 "assgn.tab.c"
    break;

  case 55: /* expression: primaryExpression dot length  */
#line 763 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), (yyvsp[-1].list));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2418 "assgn.tab.c"
    break;

  case 56: /* expression: primaryExpression  */
#line 770 "assgn.y"
            {
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2427 "assgn.tab.c"
    break;

  case 57: /* expression: primaryExpression dot identifier leftpar multipleExpressions rightpar  */
#line 775 "assgn.y"
            {
			
              (yyval.list)=createList();
              combineList((yyval.list), (yyvsp[-5].list));
              combineList((yyval.list), (yyvsp[-4].list));
              combineList((yyval.list), (yyvsp[-3].list));
              combineList((yyval.list), (yyvsp[-2].list));
              combineList((yyval.list), listOfExpressionList((yyvsp[-1].expressionList)));
              combineList((yyval.list), (yyvsp[0].list));
            }
#line 2442 "assgn.tab.c"
    break;

  case 58: /* expression: identifier leftpar multipleExpressions rightpar  */
#line 786 "assgn.y"
            {
              (yyval.list)=createList();
              Macro* m= macros->head;
              ExpressionNode* reparg= (yyvsp[-1].expressionList)->head;
              int cnt1=0;

              ExpressionNode* tmp1= (yyvsp[-1].expressionList)->head;
              while(tmp1)
              {
                cnt1++;
                tmp1=tmp1->next;
              }
              
              while(m)
              {
                if(!(m->isExpr))
                {
                  m=m->next;
                  continue;
                }
                if(strcmp(m->id->str, (yyvsp[-3].list)->head->str)==0)
                {				
                  int cnt2=0;
                  Node* tmp2= m->args->head;
                  while(tmp2)
                  {
                    cnt2++;
                    tmp2= tmp2->next;
                  }
                  if(cnt2!=cnt1)
                  {
                    m=m->next;
                    continue;
                  }
                  Node* a= m->args->head;
                  ExpressionList* replaced = createExpressionList();
                  Node* tmp=m->replacement->head;
                  while(tmp)
                  {
                    addExpressionNode(createExpressionNode(createNodeList(tmp->str)), replaced);
                    tmp=tmp->next;
                  }
                  
                  while(a && reparg)
                  {
                    Node* repl= m->replacement->head;
                    ExpressionNode* final_repl=replaced->head;
                    while(repl)
                    {
                      if(strcmp(a->str, repl->str)==0)
                      {
                        replaceNode(final_repl, reparg);
                      }
                      repl=repl->next;
                      final_repl=final_repl->next;
                    }
                    a=a->next;
                    reparg=reparg->next;

                  }
                  (yyval.list)=listOfExpressionList2(replaced);
                  break;
                }
                m=m->next;
              
              }
              if(!m)
              {
                printf("//Macro Expression Definition not found\n");
                return -1;
              }
            }
#line 2519 "assgn.tab.c"
    break;

  case 59: /* expressions: %empty  */
#line 859 "assgn.y"
                     {(yyval.expressionList)=createExpressionList();}
#line 2525 "assgn.tab.c"
    break;

  case 60: /* expressions: comma expression expressions  */
#line 861 "assgn.y"
            {
              (yyval.expressionList)=createExpressionList();
              addExpressionNode(createExpressionNode((yyvsp[-1].list)), (yyval.expressionList));
              combineExpressionList((yyval.expressionList), (yyvsp[0].expressionList));
            }
#line 2535 "assgn.tab.c"
    break;

  case 61: /* multipleExpressions: %empty  */
#line 867 "assgn.y"
                            {(yyval.expressionList)=createExpressionList();}
#line 2541 "assgn.tab.c"
    break;

  case 62: /* multipleExpressions: expression expressions  */
#line 869 "assgn.y"
                    {
                      (yyval.expressionList)=createExpressionList();
                      addExpressionNode(createExpressionNode((yyvsp[-1].list)), (yyval.expressionList));
                      combineExpressionList((yyval.expressionList), (yyvsp[0].expressionList));
                    }
#line 2551 "assgn.tab.c"
    break;

  case 63: /* primaryExpression: integer  */
#line 876 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2560 "assgn.tab.c"
    break;

  case 64: /* primaryExpression: true  */
#line 881 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2569 "assgn.tab.c"
    break;

  case 65: /* primaryExpression: false  */
#line 886 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2578 "assgn.tab.c"
    break;

  case 66: /* primaryExpression: identifier  */
#line 891 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2587 "assgn.tab.c"
    break;

  case 67: /* primaryExpression: this  */
#line 896 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2596 "assgn.tab.c"
    break;

  case 68: /* primaryExpression: new int leftsquare expression rightsquare  */
#line 901 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[-4].list));
                    combineList((yyval.list), (yyvsp[-3].list));
                    combineList((yyval.list), (yyvsp[-2].list));
                    combineList((yyval.list), (yyvsp[-1].list));
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2609 "assgn.tab.c"
    break;

  case 69: /* primaryExpression: new identifier leftpar rightpar  */
#line 910 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[-3].list));
                    combineList((yyval.list), (yyvsp[-2].list));
                    combineList((yyval.list), (yyvsp[-1].list));
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2621 "assgn.tab.c"
    break;

  case 70: /* primaryExpression: not expression  */
#line 918 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[-1].list));
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2631 "assgn.tab.c"
    break;

  case 71: /* primaryExpression: leftpar expression rightpar  */
#line 924 "assgn.y"
                  {
                    (yyval.list)=createList();
                    combineList((yyval.list), (yyvsp[-2].list));
                    combineList((yyval.list), (yyvsp[-1].list));
                    combineList((yyval.list), (yyvsp[0].list));
                  }
#line 2642 "assgn.tab.c"
    break;

  case 72: /* eq: EQ  */
#line 931 "assgn.y"
       {(yyval.list)=createNodeList("=");}
#line 2648 "assgn.tab.c"
    break;

  case 73: /* leq: LEQ  */
#line 933 "assgn.y"
         {(yyval.list)=createNodeList("<=");}
#line 2654 "assgn.tab.c"
    break;

  case 74: /* and: AND  */
#line 935 "assgn.y"
         {(yyval.list)=createNodeList("&&");}
#line 2660 "assgn.tab.c"
    break;

  case 75: /* or: OR  */
#line 937 "assgn.y"
       {(yyval.list)=createNodeList("||");}
#line 2666 "assgn.tab.c"
    break;

  case 76: /* not: NOT  */
#line 939 "assgn.y"
         {(yyval.list)=createNodeList("!");}
#line 2672 "assgn.tab.c"
    break;

  case 77: /* add: ADD  */
#line 941 "assgn.y"
         {(yyval.list)=createNodeList("+");}
#line 2678 "assgn.tab.c"
    break;

  case 78: /* sub: SUB  */
#line 943 "assgn.y"
         {(yyval.list)=createNodeList("-");}
#line 2684 "assgn.tab.c"
    break;

  case 79: /* mul: MUL  */
#line 945 "assgn.y"
         {(yyval.list)=createNodeList("*");}
#line 2690 "assgn.tab.c"
    break;

  case 80: /* div: DIV  */
#line 947 "assgn.y"
         {(yyval.list)=createNodeList("/");}
#line 2696 "assgn.tab.c"
    break;

  case 81: /* dot: DOT  */
#line 950 "assgn.y"
         {(yyval.list)=createNodeList(".");}
#line 2702 "assgn.tab.c"
    break;

  case 82: /* true: TRUE  */
#line 952 "assgn.y"
           {(yyval.list)=createNodeList("true");}
#line 2708 "assgn.tab.c"
    break;

  case 83: /* false: FALSE  */
#line 954 "assgn.y"
             {(yyval.list)=createNodeList("false");}
#line 2714 "assgn.tab.c"
    break;

  case 84: /* this: THIS  */
#line 956 "assgn.y"
           {(yyval.list)=createNodeList("this");}
#line 2720 "assgn.tab.c"
    break;

  case 85: /* new: NEW  */
#line 958 "assgn.y"
         {(yyval.list)=createNodeList("new");}
#line 2726 "assgn.tab.c"
    break;

  case 86: /* leftpar: LEFTPAR  */
#line 960 "assgn.y"
                 {(yyval.list)=createNodeList("(");}
#line 2732 "assgn.tab.c"
    break;

  case 87: /* rightpar: RIGHTPAR  */
#line 962 "assgn.y"
                   {(yyval.list)=createNodeList(")");}
#line 2738 "assgn.tab.c"
    break;

  case 88: /* leftcurly: LEFTCURLY  */
#line 964 "assgn.y"
                     {(yyval.list)=createNodeList("{");}
#line 2744 "assgn.tab.c"
    break;

  case 89: /* rightcurly: RIGHTCURLY  */
#line 967 "assgn.y"
                       {(yyval.list)=createNodeList("}");}
#line 2750 "assgn.tab.c"
    break;

  case 90: /* class: CLASS  */
#line 969 "assgn.y"
             {(yyval.list)=createNodeList("class");}
#line 2756 "assgn.tab.c"
    break;

  case 91: /* println: PRINTLN  */
#line 971 "assgn.y"
                 {(yyval.list)=createNodeList("System.out.println");}
#line 2762 "assgn.tab.c"
    break;

  case 92: /* public: PUBLIC  */
#line 973 "assgn.y"
               {(yyval.list)=createNodeList("public");}
#line 2768 "assgn.tab.c"
    break;

  case 93: /* static: STATIC  */
#line 975 "assgn.y"
               {(yyval.list)=createNodeList("static");}
#line 2774 "assgn.tab.c"
    break;

  case 94: /* void: VOID  */
#line 977 "assgn.y"
           {(yyval.list)=createNodeList("void");}
#line 2780 "assgn.tab.c"
    break;

  case 95: /* main: MAIN  */
#line 979 "assgn.y"
           {(yyval.list)=createNodeList("main");}
#line 2786 "assgn.tab.c"
    break;

  case 96: /* semicolon: SEMICOLON  */
#line 981 "assgn.y"
                     {(yyval.list)=createNodeList(";");}
#line 2792 "assgn.tab.c"
    break;

  case 97: /* extends: EXTENDS  */
#line 984 "assgn.y"
                 {(yyval.list)=createNodeList("extends");}
#line 2798 "assgn.tab.c"
    break;

  case 98: /* leftsquare: LEFTSQUARE  */
#line 986 "assgn.y"
                       {(yyval.list)=createNodeList("[");}
#line 2804 "assgn.tab.c"
    break;

  case 99: /* rightsquare: RIGHTSQUARE  */
#line 988 "assgn.y"
                         {(yyval.list)=createNodeList("]");}
#line 2810 "assgn.tab.c"
    break;

  case 100: /* comma: COMMA  */
#line 990 "assgn.y"
             {(yyval.list)=createNodeList(",");}
#line 2816 "assgn.tab.c"
    break;

  case 101: /* return: RETURN  */
#line 992 "assgn.y"
               {(yyval.list)=createNodeList("return");}
#line 2822 "assgn.tab.c"
    break;

  case 102: /* if: IF  */
#line 994 "assgn.y"
       {(yyval.list)=createNodeList("if");}
#line 2828 "assgn.tab.c"
    break;

  case 103: /* else: ELSE  */
#line 996 "assgn.y"
           {(yyval.list)=createNodeList("else");}
#line 2834 "assgn.tab.c"
    break;

  case 104: /* while: WHILE  */
#line 998 "assgn.y"
             {(yyval.list)=createNodeList("while");}
#line 2840 "assgn.tab.c"
    break;

  case 105: /* string: STRING  */
#line 1001 "assgn.y"
               {(yyval.list)=createNodeList("String");}
#line 2846 "assgn.tab.c"
    break;

  case 106: /* int: INT  */
#line 1003 "assgn.y"
         {(yyval.list)=createNodeList("int");}
#line 2852 "assgn.tab.c"
    break;

  case 107: /* boolean: BOOLEAN  */
#line 1005 "assgn.y"
                 {(yyval.list)=createNodeList("boolean");}
#line 2858 "assgn.tab.c"
    break;

  case 108: /* identifier: IDENTIFIER  */
#line 1007 "assgn.y"
                       { (yyval.list)=createNodeList( (yyvsp[0].string));}
#line 2864 "assgn.tab.c"
    break;

  case 109: /* length: LENGTH  */
#line 1009 "assgn.y"
               {(yyval.list)=createNodeList("length");}
#line 2870 "assgn.tab.c"
    break;

  case 110: /* integer: INTEGER  */
#line 1011 "assgn.y"
                 {(yyval.list)=createNodeList((yyvsp[0].string));}
#line 2876 "assgn.tab.c"
    break;

  case 111: /* definestmt: DEFINESTMT  */
#line 1014 "assgn.y"
                       {(yyval.list)=createList();}
#line 2882 "assgn.tab.c"
    break;

  case 112: /* definestmt0: DEFINESTMT0  */
#line 1016 "assgn.y"
                         {(yyval.list)=createList();}
#line 2888 "assgn.tab.c"
    break;

  case 113: /* definestmt1: DEFINESTMT1  */
#line 1018 "assgn.y"
                          {(yyval.list)=createList();}
#line 2894 "assgn.tab.c"
    break;

  case 114: /* definestmt2: DEFINESTMT2  */
#line 1020 "assgn.y"
                         {(yyval.list)=createList();}
#line 2900 "assgn.tab.c"
    break;

  case 115: /* defineexpr: DEFINEEXPR  */
#line 1023 "assgn.y"
                       {(yyval.list)=createList();}
#line 2906 "assgn.tab.c"
    break;

  case 116: /* defineexpr0: DEFINEEXPR0  */
#line 1025 "assgn.y"
                         {(yyval.list)=createList();}
#line 2912 "assgn.tab.c"
    break;

  case 117: /* defineexpr1: DEFINEEXPR1  */
#line 1027 "assgn.y"
                         {(yyval.list)=createList();}
#line 2918 "assgn.tab.c"
    break;

  case 118: /* defineexpr2: DEFINEEXPR2  */
#line 1029 "assgn.y"
                         {(yyval.list)=createList();}
#line 2924 "assgn.tab.c"
    break;

  case 119: /* neq: NEQ  */
#line 1031 "assgn.y"
         {(yyval.list)=createNodeList("!=");}
#line 2930 "assgn.tab.c"
    break;


#line 2934 "assgn.tab.c"

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
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

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
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
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
  ++yynerrs;

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

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
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
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
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
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 1034 "assgn.y"


void yyerror(const char* s)
{
  printf("//Failed to parse input code");
}
int main()
{
  left=0;
  macros=(MacroList *)malloc(sizeof(MacroList));
  macros->head = macros->tail = NULL;
  yyparse();
  return 0;
}
#include "lex.yy.c"
